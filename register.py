
import psycopg2
from flask import Blueprint, current_app, render_template, request
from flask_wtf import Form
from wtforms import StringField, PasswordField, SubmitField

register_app = Blueprint('register_app', __name__)

class RegisterForm(Form):
    name = StringField('Username')
    email = StringField('Email Address')
    password = PasswordField('Password')
    submit = SubmitField('Sign up')

@register_app.route('/signup', methods = ['POST'])
def newuser():
    data_username = request.form["username"]
    data_password = request.form["password"]
    data_email = request.form["email"]

    with psycopg2.connect(current_app.config['dsn']) as conn:
        crs = conn.cursor()
        crs.execute("insert into users (UserName, Password, email) values (%s, %s, %s)",(data_username,data_password,data_email))
        conn.commit()

    return render_template("message.html",message="Successfully registered")


@register_app.route('/update_user',methods=["POST"])
def updateUser():
    data_username = request.form["username"]
    data_password = request.form["password"]
    data_email = request.form["email"]


    with psycopg2.connect(current_app.config['dsn']) as conn:
        crs = conn.cursor()
        crs.execute("update users set username=%s, password=%s,email=%s where username = %s",(data_username,data_password,data_email,data_username))

    return render_template('update.html',message="Successfully updated")


@register_app.route('/remove_user',methods=["POST"])
def removeUser():
    data_username = request.form["username"]
    with psycopg2.connect(current_app.config['dsn']) as conn:
        crs = conn.cursor()
        crs.execute("delete from users where username = %s",(data_username,))
        data = conn.commit()

    return render_template('message.html', message="Account deleted")
