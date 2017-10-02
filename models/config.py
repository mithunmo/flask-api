from nav import db

class Config(db.Model):
    __tablename__ = "config"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))    
    mnrIP = db.Column(db.String(100))
    pcfIP = db.Column(db.String(100))
    instIP = db.Column(db.String(100))
    opsDirectorUsername = db.Column(db.String(100))
    opsDirectorPassword = db.Column(db.String(100))
    opsDirectorIP = db.Column(db.String(100))
    appsManagerUser = db.Column(db.String(100))
    appsManagerPassword = db.Column(db.String(100))
    appsDomain = db.Column(db.String(100))
    privateKey = db.Column(db.String(300))
    pcfUsername = db.Column(db.String(300))
    pcfPassword = db.Column(db.String(300))
    vcenterIP = db.Column(db.String(300))
    vcenterUsername = db.Column(db.String(300))
    vcenterPassword = db.Column(db.String(300))
    
 
    def __init__(self, mnrip, instip, name, pcfIP, opsDirectorIP, opsDirectorUsername, opsDirectorPassword, appsManagerUser, appsManagerPassword , appsDomain, privateKey, pcfuname, pcfpass, vIP, vUsername, vPassword):
        self.mnrIP = mnrip
        self.instIP = instip
        self.name = name
        self.pcfIP = pcfIP
        self.opsDirectorIP = opsDirectorIP
        self.opsDirectorUsername = opsDirectorUsername
        self.opsDirectorPassword = opsDirectorPassword
        self.appsManagerUser = appsManagerUser
        self.appsManagerPassword = appsManagerPassword
        self.appsDomain = appsDomain
        self.privateKey = privateKey
        self.pcfUsername = pcfuname
        self.pcfPassword = pcfpass
        self.vcenterIP = vIP
        self.vcenterUsername = vUsername
        self.vcenterPassword = vPassword
