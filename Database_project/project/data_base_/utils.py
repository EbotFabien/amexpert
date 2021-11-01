from Database_project.project.data_base_ import mail
from flask import  url_for
from flask_mail import Message
import random
##from PIL import Image 
from flask import  url_for,current_app
import os
#import secrets


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

'''def save_picture(form_picture):
    random_hex = secrets.token_hex(8)
    _, f_ext = os.path.splitext(form_picture.filename)
    picture_fn = random_hex + f_ext
    picture_path = os.path.join(current_app.root_path,'static/pictures',picture_fn)
    
    output_size = (125,125)
    i= Image.open(form_picture)
    i.thumbnail(output_size)

    i.save(picture_path)

    return picture_fn'''