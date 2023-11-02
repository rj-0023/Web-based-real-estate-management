from flask import Flask,render_template,request,session, redirect
from flask_sqlalchemy import SQLAlchemy
import json
#from werkzeug import secure_filename
from datetime import datetime
import math

with open('config.json','r') as c:
    para =  json.load(c)["para"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = para['upload_location']


if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = para['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = para['prod_uri']

db = SQLAlchemy(app)

class Contact(db.Model):
    s_no = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=False, nullable=False)
    email = db.Column(db.String, unique=False, nullable=False)
    subject = db.Column(db.String, unique=False, nullable=True)
    message = db.Column(db.String,  unique=False, nullable=False)
    date = db.Column(db.String, unique=False, nullable=False)


class Posts(db.Model):
    s_no = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, unique=False, nullable=False)
    status = db.Column(db.String, unique=False, nullable=False)
    category = db.Column(db.String, unique=False, nullable=False)
    rooms = db.Column(db.String, unique=False, nullable=True)
    carpet_area = db.Column(db.String,  unique=False, nullable=False)
    price = db.Column(db.String, unique=False, nullable=False)
    location = db.Column(db.String, unique=False, nullable=False)
    date = db.Column(db.String, unique=False, nullable=False)
    slug = db.Column(db.String, unique=True, nullable=False)
    features = db.Column(db.String, unique=False, nullable=False)
    content = db.Column(db.String, unique=False, nullable=False)
    name = db.Column(db.String, unique=False, nullable=False)
    img1 = db.Column(db.String, unique=False, nullable=True)
    img2 = db.Column(db.String, unique=False, nullable=True)
    img3 = db.Column(db.String, unique=False, nullable=True)
    img4 = db.Column(db.String, unique=False, nullable=True)
    img5 = db.Column(db.String, unique=False, nullable=True)



@app.route("/")
def home():
    return render_template('index.html', para=para)

@app.route("/404")
def E404():
    return render_template('404.html',para=para)

@app.route("/blog-archive")
def blogArchive():
    return render_template('blog-archive.html',para=para)

@app.route("/blog-single")
def blogSinlge():
    return render_template('blog-single.html',para=para)

@app.route("/contact", methods = ['POST','GET'])
def contact():

    if(request.method=='POST'):
        name = request.form.get('author')
        email = request.form.get('email')
        subject = request.form.get('subject')
        message = request.form.get('comment')
        entry = Contact(name = name, email = email, subject=subject, message = message, date = datetime.now())
        db.session.add(entry)
        db.session.commit()
        
    return render_template('contact.html',para=para)

@app.route("/gallery")
def gallery():
    return render_template('gallery.html',para=para)

@app.route("/index")
def index():
    posts=Posts.query.filter_by().all()[0:9]
    return render_template('index.html',para=para, posts=posts)

@app.route("/properties-detail")
def preopertiesDetail():
    post = Posts.query.all()
    return render_template('properties-detail.html',para=para, post=post)

@app.route("/properties")
def properties():
    page = request.args.get('page', 1, type=int)
    posts=Posts.query.paginate(page=page, per_page=para['no_of_posts'])
    return render_template('properties.html',para=para, posts=posts)

@app.route("/properties-detail/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('properties-detail.html',para=para, post=post)

@app.route("/register")
def register():
    return render_template('register.html',para=para)

#@app.route("/uploader")
#def uploader():
#    if ('user' in session and session['user'] == para['admin_user']):
#        if (request.method=='POST'):
#            f = request.files['file1']
#           f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
#            return "Upload Successfully"
#
#    return render_template('register.html',para=para)

@app.route("/signin")
def signIn():
    return render_template('signin.html',para=para)

@app.route("/dashboard.html", methods=['GET', 'POST'])
def adminLogIn():

    if ('user' in session and session['user'] == para['admin_user']):
        posts = Posts.query.all()
        return render_template("dashboard.html", para=para, posts=posts)

    if request.method=='POST':
        user_id = request.form.get('email')
        user_pass = request.form.get('password')
        if (user_id == para['admin_user'] and user_pass == para['admin_password']):
            session['user'] =  user_id
            posts = Posts.query.all()
            return render_template("dashboard.html", para=para, posts=posts)

    else:
        return render_template('login.html',para=para)


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if('user' in session and session['user'] == para['admin_user']):
        if request.method == 'POST':
            title = request.form.get('title')
            name= request.form.get('name')
            status= request.form.get('status')
            content= request.form.get('content')
            category= request.form.get('category')
            rooms= request.form.get('rooms')
            carpet_area= request.form.get('carpet_area')
            price= request.form.get('price')
            location= request.form.get('location')
            date= request.form.get('date')
            slug= request.form.get('slug')
            features= request.form.get('features')
            img_file= request.form.get('img_file')

            if sno == '0':
                post = Posts(title=title, name=name, status=status, content=content, category=category, rooms=rooms, carpet_area=carpet_area, price=price, location=location, date=datetime.now(), slug=slug, features=features, img1=img_file)
                db.session.add(post)
                db.session.commit()
            
            else:
                post=Posts.query.filter_by(s_no=sno).first()
                title=title
                name=name
                status=status
                content=content
                category=category
                rooms=rooms
                carpet_area=carpet_area
                price=price
                location=location
                date=datetime.now()
                slug=slug
                features=features
                img1=img_file
                db.session.commit()
                return redirect('/edit/'+sno)
        post=Posts.query.filter_by(s_no=sno).first()
        return render_template('edit.html', para=para, post=post)
    return render_template('login.html',para=para)


@app.route("/logout", methods=['GET'])
def logout():
    session.pop('user')
    return redirect('/dashboard.html')

@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if('user' in session and session['user'] == para['admin_user']):
        post = Posts.query.filter_by(s_no=sno).first()
        db.session.delete(post)
        db.session.commit() 
    return redirect('/dashboard.html')


app.run(debug=True)

