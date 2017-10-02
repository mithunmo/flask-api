# This contains our frontend; since it is a bit messy to use the @app.route
# decorator style when using application factories, all of our routes are
# inside blueprints. This is the front-facing blueprint.
#
# You can find out more about blueprints at
# http://flask.pocoo.org/docs/blueprints/

from flask import Blueprint, render_template, flash, redirect, url_for, request
from flask_bootstrap import __version__ as FLASK_BOOTSTRAP_VERSION
from flask_nav.elements import Navbar, View, Subgroup, Link, Text, Separator
from markupsafe import escape

from forms import SignupForm
from nav import nav
from models.package import Package
from models.package import PackageSuite
from models.result import Result
from models.result import ResultSuite
from models.feature import Feature
from models.config import Config
from nav import db
from sqlalchemy import desc
import subprocess
import os
from robot.parsing.model import TestData
import datetime

frontend = Blueprint('frontend', __name__)

# We're adding a navbar as well through flask-navbar. In our example, the
# navbar has an usual amount of Link-Elements, more commonly you will have a
# lot more View instances.
nav.register_element('frontend_top', Navbar(
    View('NHC Automation tool', '.index'),
    View('Create Package', '.package_form'),
    View('Package', '.package_list'),  
    View('Create Config', '.create_config'),
    View('Configs', '.configs_list'),    
    View('Features', '.feature_list'),
    View('Results', '.result_list'),
    ))


# Our index-page just shows a quick explanation. Check out the template
# "templates/index.html" documentation for more details.
@frontend.route('/')
def index():
    return render_template('index.html')

@frontend.route('/packages/', methods=('GET', 'POST'))
def package_list():
    package = Package.query.order_by(desc('id')).all()
    return render_template('packages.html',package=package)

@frontend.route("/features/", methods=('GET','POST'))
def feature_list():
    feature = Feature.query.order_by(desc("id")).all()
    return render_template("features.html",feature=feature)

# Shows a long signup form, demonstrating form rendering.
@frontend.route('/create-packages/', methods=('GET', 'POST'))
def package_form():
    form = SignupForm(request.form)
    feature = Feature.query.all()
    config = Config.query.all()
    if request.method == "POST":        
        packageObj = Package(form.name.data,form.descname.data,request.form["config"])
        db.session.add(packageObj)
        for fid in request.form.getlist("feature"):
            packagesuiteObj = PackageSuite(packageObj,fid,1)
            db.session.add(packagesuiteObj)
         
        db.session.commit()
        return redirect("/packages/")

        flash('Hello, {}. You have successfully signed up'
              .format(escape(form.name.data)))
    else:
        print "not validated"
    return render_template('package.html', form=form, feature=feature, config=config)



@frontend.route('/results/', methods=('GET', 'POST'))
def result_list():
    result = Result.query.order_by(desc('id')).all()
    return render_template('result.html', result=result)


@frontend.route('/config/', methods=('GET', 'POST'))
def create_config():
    if request.method == "POST":
        configObj = Config(request.form["mnrip"].strip(), request.form["instip"].strip(), request.form["name"],
        request.form["pcfip"].strip(),request.form["opsip"].strip(),"admin", request.form["opspass"].strip(),
        "admin", request.form["appspass"].strip(),request.form["appsdomain"].strip(), request.form["key"].strip(),
        request.form["pcfuname"].strip(), request.form["pcfpass"].strip(),
        request.form["vcenterip"].strip(), request.form["vcenteruname"].strip(),request.form["vcenterpass"].strip())
        db.session.add(configObj)         
        db.session.commit()
        return redirect("/configs/")
    else:
        print "not validated"    
    return render_template('config.html')

@frontend.route('/configs/', methods=('GET', 'POST'))
def configs_list():
    config = Config.query.order_by(desc('id')).all()
    return render_template('configs.html', config=config)


@frontend.route('/config-details/', methods=('GET', 'POST'))
def config_details():
    if request.method == "GET":
        cid = request.args.get("cid")
        configDetails = Config.query.get(cid)
        return render_template('config_details.html', configDetails=configDetails)
    elif request.method == "POST":
        id = request.form["id"]
        configObj = Config.query.get(id)
        configObj.mnrIP = request.form["mnrip"].strip()
        configObj.instIP = request.form["instip"].strip()
        configObj.pcfIP = request.form["pcfip"].strip()
        configObj.opsDirectorIP = request.form["opsip"].strip()
        configObj.opsDirectorPassword = request.form["opspass"].strip()
        configObj.appsManagerPassword = request.form["appspass"].strip()
        configObj.appsDomain = request.form["appsdomain"].strip()
        configObj.privateKey = request.form["key"].strip()
        configObj.pcfUsername = request.form["pcfuname"].strip()
        configObj.pcfPassword = request.form["pcfpass"].strip()
        configObj.vcenterIP = request.form["vcenterip"].strip()
        configObj.vcenterUsername = request.form["vcenteruname"].strip()
        configObj.vcenterPassword = request.form["vcenterpass"].strip()

        db.session.commit()
        config = Config.query.order_by(desc('id')).all()
        return render_template('configs.html', config=config)

@frontend.route('/result-details/', methods=('GET', 'POST'))
def result_details():
    rid = request.args.get("rid")
    resultDetails = ResultSuite.query.filter_by(resultID=rid)
    return render_template('result_details.html', resultDetails=resultDetails)


@frontend.route('/log/', methods=('GET', 'POST'))
def log_details():
    id = request.args.get("id")
    resultDetails = ResultSuite.query.get(id)
    return render_template('log.html', resultDetails=resultDetails)


@frontend.route('/run/', methods=['GET'])
def run_package():

    suite = PackageSuite.query.all()
    total = 0
    passes = 0
    fail = 0
    pid = request.args.get("pid")
    result = Result(pid, passes + fail , passes, fail, datetime.date.today().isoformat(), "Scheduled",0, "")
    db.session.add(result) 
    db.session.commit()
    return redirect("/results/")
    





