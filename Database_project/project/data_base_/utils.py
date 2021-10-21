from project.data_base_ import mail
from flask import  url_for
from flask_mail import Message
import random


def send_reset_email(user):
    token = user.get_reset_token()
    msg = Message('Password Reset Request',
                  sender='noreply@demo.com',
                  recipients=[user.email])
    msg.body = f''' To reset your password,visit the following link:
               {url_for('users.reset_password',token=token,_external=True)}
     
                if you did not make this request then simply ignore this email and no changes will be made
                '''
    mail.send(msg)

def generate(lis):
            ref= int(random.randrange(100000, 999999))
            try:
                if lis.index(ref):
                    generate(lis)
            except:
                return ref