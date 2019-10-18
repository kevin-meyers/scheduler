import os

from flask import Flask, render_template, request, url_for, redirect
from pymongo import MongoClient
from pyswip import Prolog

prolog = Prolog()
prolog.consult('Scheduler.pl')

client = MongoClient(
    f'mongodb+srv://{os.getenv("MONGODB_USER")}:{os.getenv("MONGODB_PASSWORD")}@'
    'cluster0-gwjng.mongodb.net/admin?retryWrites=true&w=majority', connect=False
)

db = client.Scheduler
classtimes = db.classtimes

app = Flask(__name__)


@app.route('/')
def home():

    return render_template('index.html')


@app.route('/view')
def view_classes():
    return render_template('class_list.html', classes=classtimes.find())


@app.route('/add')
def add_class():
    return render_template(
        'class_add.html', fields=['name', 'time', 'instructor']
    )


@app.route('/add_classtime', methods=['POST'])
def add_classtime():
    classtimes.insert_one(request.form.to_dict())
    return redirect(url_for('view_classes'))


@app.route('/choose-classes')
def choose_classes():
    return render_template('class-select.html', classes = classtimes.distinct('name'))


@app.route('/build-schedule', methods=['GET', 'POST'])
def build_schedule():
    choices = request.form.getlist('select')
    
