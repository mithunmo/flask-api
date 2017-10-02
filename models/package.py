
from nav import db
class Package(db.Model):
    __tablename__ = "package"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    description = db.Column(db.String(100))
    configID = db.Column(db.Integer)

    def __init__(self, name, description, configID):
        self.name = name
        self.description = description
        self.configID = configID

    def __repr__(self):
        return '<User %r>' % self.name

class PackageSuite(db.Model):
    __tablename__= "packagesuite"

    id = db.Column(db.Integer, primary_key=True)
    packageID = db.Column(db.Integer, db.ForeignKey('package.id'))
    package = db.relationship('Package',backref=db.backref('packagesuite', lazy='dynamic'))
    featureID = db.Column(db.Integer)
    testcaseID = db.Column(db.Integer)

    def __init__(self, package, featureID, testcaseID ):
        self.package = package
        self.featureID = featureID
        self.testcaseID = testcaseID

