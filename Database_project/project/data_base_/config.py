import os
class Config:
    SECRET_KEY='FABIENCLASSIC'
    SQLALCHEMY_DATABASE_URI = "postgresql+psycopg2://postgres:1234@db/amexpert"
    MAIL_SERVER ='smtp.googlemail.com'
    MAIL_PORT = 587
    MAIL_USE_TLS =True
    MAIL_USERNAME = 'touchone0001@gmail.com'
    MAIL_PASSWORD = 'onetouch000100'
    RECAPTCHA_PUBLIC_KEY ='6LcghOIZAAAAAE3zgcS-maNClYmtLTqICZtmHvWi'
    RECAPTCHA_PRIVATE_KEY='6LcghOIZAAAAAFiTeOmn_gN6xW_sGIFTDcVdIO0x'
    UPLOAD_FOLDER=os.getcwd()+'\\data_base_\\static\\files'
    DEBUG = True
    CACHE_TYPE= "simple" # Flask-Caching related configs
    CACHE_DEFAULT_TIMEOUT= 300