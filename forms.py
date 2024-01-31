from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, TextAreaField, SubmitField, IntegerField
from wtforms.validators import DataRequired, Email, EqualTo, Length


class LoginForm(FlaskForm):
    username = StringField('Имя пользователя:', validators=[DataRequired()])
    email = StringField('Email:', validators=[DataRequired(), Email()])
    password = PasswordField('Пароль:', validators=[DataRequired()])


class RegistrationForm(FlaskForm):
    username = StringField('Имя пользователя:', validators=[DataRequired(), Length(min=3, max=25)])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Пароль:', validators=[DataRequired(), Length(min=6)])
    confirm_password = PasswordField('Подтвердите пароль:', validators=[DataRequired(), EqualTo('password')])


class CommentForm(FlaskForm):
    #author = StringField('Author', validators=[DataRequired()])
    text = TextAreaField('Комментарий', validators=[DataRequired()])
    submit = SubmitField('Добавить комментарий')


class AdminForm(FlaskForm):
    submit = SubmitField('Удалить комментарий')


class ReviewsForm(FlaskForm):
    id = IntegerField('Комментарий ID:')
    author = StringField('Имя пользователя:', validators=[DataRequired(), Length(min=3, max=25)])
    text = TextAreaField('Комментарий:', validators=[DataRequired()])
    submit = SubmitField('Обновить комментарий')

