from nav import db

class Feature(db.Model):
    __tablename__ = "feature"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
 
    def __init__(self, name, description):
        self.name = name
 
    def __repr__(self):
        return '<User %r>' % self.name

