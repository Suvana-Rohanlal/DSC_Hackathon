import requests
import json

import geoip2.database as geo
from bs4 import BeautifulSoup

from geopy.geocoders import Nominatim

url = "https://crudcrud.com/api/b82c1da1f3704ca1992b6836cd39b856"

# Param: username, password, email
# Return : unique user id on success, else False
def loginUser(email, psw):
    endpoint = "/users"
    _url = url + endpoint

    response = requests.get(_url)
    response = response.json()
    for user in response:
        if user["email"] == email:
            if user["password"] == psw:
                uid = user["_id"]
                print("Signed in!")
                return uid
    print("Signed Failed, try again?")
    return False

# Param: username, password, email
# Return : User ID on success, else False
def signUser(usr, psw, email):
    endpoint = "/users"

    _url = url + endpoint

    user = {
        "username": usr,
        "email": email,
        "password": psw,
        "type": 1
    }
    temp = user
    print(user)

    response = requests.post(_url, json = user, headers =  {'Content-Type': 'application/json; charset=UTF-8'})

    if response.status_code == 201:
        response = response.json()
        return response["_id"]

    return False

# Return: list of dict of all businesses
def fetch_all():
    endpoint = "/business"

    _url = url + endpoint

    all_data = requests.get(_url)
    data = all_data.json()

    return data


def register_bus(name, about, location, tag, uid, contact, catl):

    endpoint = "/business"
    _url = url + endpoint



    bus = {
        "name": name,
        "about": about,
        "location": location,
        "tag": tag,
        "owner": uid,
        "contact": contact,
        "products": catl
    }

    response = requests.post(_url, json = bus, headers =  {'Content-Type': 'application/json; charset=UTF-8'})
    print(response.json())
    print("reached")
    if response.status_code >= 200 and response.status_code < 300 :
        return True

    return False


# Return: list of dict of all businesses in same city, empty if none in city
def get_business():
    city = get_city()
    all = fetch_all()
    list = []

    geolocator = Nominatim(user_agent="web_app")

    for business in all:
        temp = str(geolocator.geocode(business["location"]))
        if city in temp:
            list.append(business)


    return list

# returns the city you are in, based on your ip
def get_city():
    URL = "https://ip8.com/ip"
    page = requests.get(URL)
    data = BeautifulSoup(page.text, 'html.parser')
    ip = str(data)

    reader = geo.Reader("GeoLite2-City.mmdb")
    response = reader.city(ip)

    city = response.city.name
    reader.close()
    return city


def get_yours(_uid):
    ls = fetch_all()

    for yours in ls:
        if yours["owner"] == _uid:
            return yours;

    return False


def get_msg(_uid):
    endpoint = "/messages"
    _url = url + endpoint
    ls = fetch_all_msg()

    temp = []

    for msg in ls:
        if msg["to"] == _uid:
            temp.append((msg["msg"], msg["from"]))

    return temp

def fetch_all_msg():
    endpoint = "/messages"
    _url = url + endpoint

    all_data = requests.get(_url)
    data = all_data.json()

    return data
