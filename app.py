import os

from flask import Flask, render_template, request, url_for
from pymongo import MongoClient


client = MongoClient(
    f'mongodb+srv://{os.getenv("MONGODB_USER")}:{os.getenv("MONGODB_PASSWORD")}@'
    'cluster0-gwjng.mongodb.net/admin?retryWrites=true&w=majority', connect=False
)

db = client.Scheduler
classtimes = db.classtimes

app = Flask(__name__)


@app.route('/')
def home():
    classtimes.insert_one({'name': 'cs1.1', 'timeslot': 1})
    return 'Hey world.'
