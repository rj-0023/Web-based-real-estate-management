from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def home():
    return render_template('index.html')

@app.route('/gallery.html')
def gallery():
    return render_template('gallery.html')

@app.route('/contact.html')
def contact():
    return render_template('contact.html')

@app.route('/properties.html')
def properties():
    return render_template('properties.html')

@app.route('/properties-detail.html')
def detail():
    return render_template('properties-detail.html')

@app.route('/register.html')
def register():
    return render_template('register.html')

@app.route('/signin.html')
def signin():
    return render_template('signin.html')

@app.route('/blog-single.html')
def single():
    return render_template('blog-single.html')

@app.route('/blog-archive.html')
def archive():
    return render_template('blog-archive.html')

@app.route('/404.html')
def error():
    return render_template('404.html')

@app.route('/index.html')
def index():
    return render_template('index.html')


app.run(debug=True)