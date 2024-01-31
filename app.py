import logging
from flask import Flask, render_template, request, flash, redirect, url_for, abort, session
from flask_login import current_user, login_user, login_required, logout_user
from models import db, login, User, Comment, Works
from forms import LoginForm, RegistrationForm, CommentForm, AdminForm, ReviewsForm
from flask_wtf.csrf import CSRFProtect

import MySQLdb


app = Flask(__name__)
app.config['SECRET_KEY'] = b'af6d09589f9cff96ef88c1d2e037f40a8a6fa258886208c8262c632c78624345'
csrf = CSRFProtect(app)
"""
>>> import secrets
>>> secrets.token_hex()
"""
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/flask_construction'
db.init_app(app)
login.init_app(app)
login.login_view = 'login'

logger = logging.getLogger(__name__)
# menu = [{"name": "Главная", "url": "/"},
#         {"name": "Цены", "url": "prices"},
#         {"name": "Фото Наших работ", "url": "photos_of_our_works"},
#         {"name": "Контакты", "url": "contacts"},
#         {"name": "Отзывы", "url": "reviews"}
#         ]


@app.route('/')
def index():
    context = {'title': 'Главная'}
    return render_template('index.html', **context)


@app.route('/contacts')
def contacts():
    context = {'title': 'Контакты'}
    return render_template('contacts.html', **context)


@app.route('/photos_of_our_works')
def photos_of_our_works():
    context = {'title': 'Фото наших работ'}
    return render_template('photos_of_our_works.html', **context)


@app.route('/reviews', methods=['GET', 'POST'])
@app.route('/reviews/page/<int:page>', methods=['GET', 'POST'])
def reviews(page=1):
    form = CommentForm()
    if form.validate_on_submit():
        comment = Comment(text=form.text.data, author=current_user.username)
        db.session.add(comment)
        db.session.commit()
    #comments = Comment.query.all()
    comments = Comment.query.paginate(per_page=5, page=page, error_out=True)
    context = {'title': 'Отзывы',
               'form': form,
               'comments': comments,
               }
    return render_template('reviews.html', **context)


@app.route('/prices')
def prices():
    works = Works.query.all()
    context = {'title': 'Цены', 'works': works}
    return render_template('prices.html', **context)


@app.errorhandler(404)
def page_not_found(e):
    logger.warning(e)
    context = {
        'title': 'Страница не найдена',
        'url': request.base_url,
    }
    return render_template('404.html', **context), 404


@app.cli.command("init-db")
def init_db():
    db.create_all()
    print('OK')


@app.route('/login', methods=['POST', 'GET'])
def login():
    if current_user.is_authenticated:
        return redirect('/')
    form = LoginForm()
    if request.method == 'POST':
        email = request.form['email']
        user = User.query.filter_by(email=email).first()
        if user is not None and user.check_password(request.form['password']):
            login_user(user)
            if request.form['email'] == 'anna@bk.ru':
                return redirect('panel')
            return redirect('/')
        else:
            flash(f"Такого пользователя нет!", 'danger')
    context = {'title': 'Авторизация', 'form': form}
    return render_template('login.html', **context)


@app.route('/register', methods=['POST', 'GET'])
def register():
    if current_user.is_authenticated:
        return redirect('/')

    if request.method == 'POST':
        email = request.form['email']
        username = request.form['username']
        password = request.form['password']

        if User.query.filter_by(email=email).first():
            flash(f"Такой '{email}' уже есть! Подберите другой mail!", 'danger')
            return redirect(url_for('register'))

        user = User(email=email, username=username)
        user.set_password(password)
        db.session.add(user)
        db.session.commit()
        flash(f"Привет, {username}! Вы успешно зарегестрировались!", 'success')
        return redirect(url_for('login'))
    form = RegistrationForm()
    context = {'title': 'Регистрация', 'form': form}
    return render_template('register.html', **context)


@app.route('/panel')
def panel():
    form = CommentForm()
    if form.validate_on_submit():
        comment = Comment(text=form.text.data, author=current_user.username)
        db.session.add(comment)
        db.session.commit()
    if current_user.is_authenticated and current_user.email == 'anna@bk.ru':
        comments = Comment.query.all()
        context = {'title': 'Отзывы',
                   'form': form,
                   'comments': comments,
                   }
        return render_template('admin/panel.html', **context)
    else:
        flash(f"Вам нужно авторизоваться!", 'danger')
        return redirect('login')


@app.route("/edit_comment/<int:comment_id>/", methods=['GET', 'POST'])
def edit_comment(comment_id):
    edited_comment = Comment.query.get_or_404(comment_id)
    form = ReviewsForm()
    if form.validate_on_submit():
        edited_comment.author = form.author.data
        edited_comment.text = form.text.data
        db.session.commit()
        return redirect(url_for('panel', comment_id=edited_comment.id))

    form.id.data = edited_comment.id
    form.author.data = edited_comment.author
    form.text.data = edited_comment.text
    return render_template('admin/edit_comment.html', form=form, title='Обновление отзыва')


@app.route('/delete_comment/<int:comment_id>', methods=['GET', 'POST'])
def delete_comment(comment_id):
    form = AdminForm()
    comment_delete = Comment.query.get_or_404(comment_id)
    if request.method == 'POST':
        db.session.delete(comment_delete)
        db.session.commit()
        return redirect(url_for('panel'))
    else:
        context = {'title': 'Отзывы',
                   'form': form,
                   'comment': comment_delete,
                   }
        return render_template('admin/delete_comment.html', **context)


@app.route('/logout')
def logout():
    logout_user()
    return redirect('/')


if __name__ == '__main__':
    app.run()
