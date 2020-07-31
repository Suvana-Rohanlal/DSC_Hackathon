from flask import Flask, render_template, request
from services import loginUser, signUser, fetch_all, register_bus, get_business, get_yours, get_msg

app = Flask(__name__)

def modify(val):

    global _uid
    _uid = val
    print(_uid)


def init(val):

    global _uid
    _uid = val
    print(_uid)

@app.route('/about')
def about():
    return render_template('about.html')


@app.route('/')
def home():

    return render_template('home.html')

@app.route('/login',methods = ['POST', 'GET'])
def login():
    return render_template('login.html')

@app.route('/signup',methods = ['POST', 'GET'])
def signUp():
    return render_template('signup.html')

@app.route('/register',methods = ['POST', 'GET'])
def register():
    return render_template('register.html')

@app.route('/search',methods = ['POST', 'GET'])
def search():
    ls = get_business()

    return render_template('search.html', nearby=ls, stop=len(ls))


@app.route('/msg', methods = ['POST','GET'])
def msg():
    ls = get_msg(_uid)
    print(ls)
    return render_template('user.html', messages = ls, stop=len(ls))

@app.route('/profile',methods = ['POST', 'GET'])
def business():
    uid = _uid
    user = request.form
    print(uid)
    if (len(user) == 3) :
        name = user["name"]
        email = user["email"]
        psw = user["pwd"]
        uid = signUser(name, psw, email)
        if uid == False:
            return "<h1>Sign Up failed, please try again.</h1>"
    elif (len(user) == 6):
        print("register")
        name = user["name"]
        contact = user["contact"]
        logo = user["logo"]
        about = user["about"].strip()
        tag = user["tag"]
        location = user["loc"]
        catl = []

        if register_bus(name, about, location, tag, uid, contact, catl):
            print("created!")
        if uid == False:
            return "<h1>Business registration failed, please login first.</h1>"
    elif(len(user) == 2):
        email = user["email"]
        psw = user["pwd"]
        uid = loginUser(email, psw)
        if uid == False:
            return "<h1>Login failed, please try again.</h1>"

    ls = get_yours(uid)
    print(ls)
    modify(uid)

    if ls == False:
        return "<h1>Please register a business</h1>"

    return render_template("edit.html", business = ls)



if __name__ == '__main__':
    init(False)
    app.run(debug=True)
