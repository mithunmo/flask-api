
from models.package import Package
from nav import db
from datetime import datetime

class Result(db.Model):
    __tablename__ = "result"
    id = db.Column(db.Integer, primary_key=True)
    #packageID = db.Column(db.Integer)
    total = db.Column(db.Integer)
    passes = db.Column("pass",db.Integer)
    fail = db.Column(db.Integer)
    executed =  db.Column(db.Date())
    packageID = db.Column(db.Integer, db.ForeignKey('package.id'))
    package = db.relationship('Package',backref=db.backref('result', lazy='dynamic'))
    
    def __init__(self, packageID, total, passes, fail, executed):
        self.packageID = packageID
        self.total = total  
        self.executed = executed
        self.passes = passes
        self.fail = fail


class ResultSuite(db.Model):
    __tablename__ = "resultsuite"
    id = db.Column(db.Integer, primary_key=True)
 
    executed =  db.Column(db.Date())
    testcaseID = db.Column(db.String(100))
    status = db.Column(db.Integer)
    executed = db.Column(db.DateTime, default=datetime.now())
    log = db.Column(db.String(500))
    packageID = db.Column(db.Integer, db.ForeignKey('package.id'))
    package = db.relationship('Package',backref=db.backref('resultsuite', lazy='dynamic'))

    resultID = db.Column(db.Integer, db.ForeignKey('result.id'))
    result = db.relationship('Result',backref=db.backref('resultsuite', lazy='dynamic'))

    def __init__(self, resultID, packageID, testcaseID, status, log):
        self.packageID = packageID
        self.testcaseID = testcaseID
        self.resultID = resultID
        self.status = status
        self.log = log


