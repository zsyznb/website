# coding=utf-8
from app import db, create_app
from flask import Flask, render_template
from flask_script import Manager
from flask_script import Shell
from flask_migrate import Migrate, MigrateCommand


app = create_app('default')
manager = Manager(app)
migrate = Migrate(app, db)


def make_shell_context():
    return dict(app=app, db=db)
manager.add_command("shell", Shell(make_context=make_shell_context))
manager.add_command('db', MigrateCommand)


@app.route('/')
def index():
    return render_template("index.html")


'''
class Event(db.Model):
    __tablename__ = "event"
    id = db.Column(db.Integer, primary_key=True)  # 事件id
    name = db.Column(db.String(100))  # 事件名称
    description = db.Column(db.String(1000))  # 事件描述
    start_datetime = db.Column(db.DateTime)  # 事件开始时间
    event_location = db.Column(db.String(40))  # 事件发生地点
    event_type = db.Column(db.String(10))  # 事件类型（线下还是线上）
    involved_users = db.relationship('User', secondary=involvement, lazy='subquery',
                                     backref=db.backref('events', lazy=True))
    posts = db.relationship('Post', backref='event',
                            lazy="dynamic")  # event 1:n post
'''

''''
@app.route('/event-trace-detail/<event_id>')
def event_trace_detail(event_id):
    event = Event.query.filter_by(id=event_id).first()
    event_name = event.name
    timeline_posts = event.posts.filter_by(
        whether_important=1).order_by(Post.post_datetime.asc())
    # print len(timeline_posts)
    timeline_dict = collections.defaultdict(list)
    for p in timeline_posts:
        key = p.post_datetime.date()
        timeline_dict[key].append(p)  # order_by保证了p插入的顺序
    timeline = sorted(timeline_dict.items(), key=itemgetter(0))
    post_count = db.func.count(User.id).label(
        "count")
    key_users = db.session.query(User.id,User.name,post_count ).join(involvement,Post).filter(
        Post.event_id == event_id).group_by(User.id).having(post_count>=5).order_by(
        post_count.desc()).all()
    return render_template("event-trace-detail.html", event=event, event_name=event_name, timeline=timeline,key_users=key_users)
'''

'''
@app.route('/event-trace-index')
def event_trace_index():
    return render_template("event-trace-index.html", events=Event.query.all())
'''

if __name__ == '__main__':
    #manager.run()
    app.run(debug=True, host='0.0.0.0', port=5000)