# Welcome to the Flask-Bootstrap sample application. This will give you a
# guided tour around creating an application using Flask-Bootstrap.
#
# To run this application yourself, please install its requirements first:
#
#   $ pip install -r sample_app/requirements.txt
#
# Then, you can actually run the application.
#
#   $ flask --app=sample_app dev
#
# Afterwards, point your browser to http://localhost:5000, then check out the
# source.

from flask import Flask
from flask_appconfig import AppConfig
from flask_bootstrap import Bootstrap
from flask_sqlalchemy import SQLAlchemy

from frontend import frontend
from nav import nav
from nav import db


def create_app(configfile=None):
    # We are using the "Application Factory"-pattern here, which is described
    # in detail inside the Flask docs:
    # http://flask.pocoo.org/docs/patterns/appfactories/

    app = Flask(__name__)

    # We use Flask-Appconfig here, but this is not a requirement
    AppConfig(app)

    # Install our Bootstrap extension
    Bootstrap(app)

    # Our application uses blueprints as well; these go well with the
    # application factory. We already imported the blueprint, now we just need
    # to register it:
    app.register_blueprint(frontend)

    # Because we're security-conscious developers, we also hard-code disabling
    # the CDN support (this might become a default in later versions):
    app.config['BOOTSTRAP_SERVE_LOCAL'] = True
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    #app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/test.db'
    #app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:password@localhost/nhc'
    #engine = create_engine('mysql://b036b0fbeb78f5:6352c20c@us-cdbr-iron-east-03.cleardb.net:3306/ad_234562919f9ba73', echo=True)
    app.config['WTF_CSRF_ENABLED'] = False

    #db = SQLAlchemy(app)
    app.config['DEBUG'] = True
    
    # We initialize the navigation as well
    nav.init_app(app)
    db.init_app(app)

    return app
