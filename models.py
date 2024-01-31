from datetime import datetime
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from flask_login import LoginManager

login = LoginManager()
db = SQLAlchemy()


class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), index=True, unique=True, nullable=False)
    email = db.Column(db.String(120), index=True, unique=True, nullable=False)
    password_hash = db.Column(db.String(428))
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    #comments = db.relationship('Comment', backref='author', lazy=True)

    def __repr__(self):
        return f'User ({self.username}, {self.email})'

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)


class Comment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.Text, nullable=False)
    author = db.Column(db.String(64), index=True, unique=True, nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    #updated_at = db.Column(db.DateTime, default=func.now(), onupdate=func.now())
    #author_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    def __repr__(self):
        return f'Comment({self.text}, {self.author})'


class Works(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(120), nullable=False)
    unit_dimensions = db.Column(db.String(80), nullable=False)
    price = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f'Works({self.title}, {self.unit_dimensions}, {self.price})'


@login.user_loader
def load_user(id):
    return User.query.get(int(id))
