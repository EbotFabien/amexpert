from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bootstrap import Bootstrap
from flask_login import login_user,current_user,logout_user,login_required,LoginManager
from flask_bcrypt import Bcrypt
from flask_mail import Mail
from Database_project.project.data_base_.config import Config
from flask_migrate import Migrate


login_manager = LoginManager()
login_manager.login_view ='users.login'
bcrypt = Bcrypt()
mail = Mail()
db = SQLAlchemy()
migrate = Migrate()


def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(Config)

    db.init_app(app)
    bootstrap=Bootstrap(app)
    bcrypt.init_app(app)
    mail.init_app(app)
    login_manager.init_app(app)
    migrate.init_app(app, db) 

    from Database_project.project.data_base_.routes import users
    app.register_blueprint(users)

    return app