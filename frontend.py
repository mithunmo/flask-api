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
    View('Users', '.index'),
    View('Create Package', '.package_form'),
    View('Package', '.package_list'),  
    View('Config', '.index'),
    View('Features', '.feature_list'),
    View('Results', '.result_list'),

    ))


# Our index-page just shows a quick explanation. Check out the template
# "templates/index.html" documentation for more details.
@frontend.route('/')
def index():
    return render_template('index.html')

"""
"""

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
    if request.method == "POST":        
        
        packageObj = Package(form.name.data,form.descname.data)
        packagesuiteObj1 = PackageSuite(packageObj,1,2)
        packagesuiteObj2 = PackageSuite(packageObj,2,3)
         
        db.session.add(packageObj)
        db.session.add(packagesuiteObj1)
        db.session.add(packagesuiteObj2) 
        db.session.commit()
        print "Saved"
        return redirect("/packages/")

        flash('Hello, {}. You have successfully signed up'
              .format(escape(form.name.data)))
    else:
        print "not validated"
    return render_template('package.html', form=form, feature=feature)



@frontend.route('/results/', methods=('GET', 'POST'))
def result_list():
    result = Result.query.order_by(desc('id')).all()
    return render_template('result.html', result=result)

@frontend.route('/result-details/', methods=('GET', 'POST'))
def result_details():

    rid = request.args.get("rid")
    #db.users.filter(db.users.name=='Joe')
    resultDetails = ResultSuite.query.filter_by(resultID=rid)
    return render_template('result_details.html', resultDetails=resultDetails)


@frontend.route('/run/', methods=['GET'])
def run_package():

    suite = PackageSuite.query.all()
    #print os.getcwd() + '\\nhc_tool\g.robot'
    #print subprocess.check_output(['robot','test1.txt'], shell=True)
    suite = TestData(parent=None, source="test1.txt")

    total = 0
    passes = 0
    fail = 0
    pid = request.args.get("pid")

    result = Result(pid, passes + fail , passes, fail, datetime.date.today().isoformat())
    db.session.add(result) 
    db.session.commit()

    for testcase in suite.testcase_table:
        print testcase.name
        print "testname==="
        #process = subprocess.Popen([ 'robot','-t', testcase.name, 'test1.txt' ],stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
        process = subprocess.Popen('robot -t "'+ testcase.name +'" test1.txt' ,stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
        returncode = process.wait()
        print(returncode)
        if returncode == 0:
            passes = passes + 1
        else:
            fail = fail + 1
        log = process.stdout.read()
        print log
        resultTC = ResultSuite(result.id , pid, testcase.name, returncode,log)
        db.session.add(resultTC) 
        db.session.commit()

    result.passes = passes
    result.fail = fail
    result.total = passes + fail
    db.session.add(result) 
    db.session.commit()

    return redirect("/results/")
    





