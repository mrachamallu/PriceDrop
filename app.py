import pyrebase
import requests
from bs4 import BeautifulSoup
import html5lib

from flask import Flask, request, render_template, redirect

app = Flask(__name__)

#NORDSTROM FETCHER
urlDefault = "/Users/ayush/Documents/Development/PriceChange/website/nordstrom/index.html"

#TODO: change from serviceAccount to userAccount
def firebaseInitialize():
    config = {
        "apiKey": "AIzaSyBjdK6z6Y0VfFHzlxfYZeeds7e4y0RBuII",
            "authDomain": "price-finder-950dd.firebaseapp.com",
            "databaseURL": "https://price-finder-950dd.firebaseio.com",
            "storageBucket": "price-finder-950dd.appspot.com",
            "serviceAccount": "serviceAccountKey.json",
    }

    firebase = pyrebase.initialize_app(config)
    db = firebase.database()
    return db

    #Initializing the firebase
db = firebaseInitialize()

def priceFetch(url):
    try:
        price = BeautifulSoup(open(url), "html5lib").body.find("div", class_= "current-price").text
        return price[1:]
    except:
        return "Error: Couldn't fetch the price"

def productAdd(url):
    fetchedPrice = priceFetch(url)
    
    uploadData = {
        "NewPrice" : fetchedPrice,
        "OldPrice" : fetchedPrice,
        "URL" : url,
    }
    
    db.child("Data").child("Products").push(uploadData)

# Home Page
@app.route("/")
def hello():
    return render_template("index.html")

@app.route("/checkPrices/<key>")
def checkPriceChange(key):
    productData = db.child("Data").child("Products").child(key).get()
    fetchedPrice = priceFetch(productData.val()["URL"])
    if (float(fetchedPrice) < float(productData.val()["NewPrice"])):
        db.child("Data").child("Products").child(productData.key()).update({"NewPrice": fetchedPrice})
        return "Price Lowered"
    else:
        return "Price Not Lowered"

#TODO: MODIFY THIS TO ADD IT TO THE USER TABLE
@app.route("/refreshPrices")
def refreshPrices():
    productsData = db.child("Data").child("Products").get()
    for productData in productsData.each():
        fetchedPrice = priceFetch(productData.val()["URL"])
        if (float(fetchedPrice) < float(productData.val()["NewPrice"])):
            db.child("Data").child("Products").child(productData.key()).update({"NewPrice": fetchedPrice})
            return "Price Lowered"
        else:
            return "Price Not Lowered"

# Route that will process the file upload
@app.route("/upload", methods=["POST"])
def upload():
    # Get the name of the uploaded file and add a product
    productAdd(request.form["URL"])
    return "Successfully Submitted!"

#Show the website
@app.route("/nordstrom")
def openWebPage():
    return redirect("website/nordstrom/index.html", code=302)

if __name__ == "__main__":
    app.run(
            host="0.0.0.0",
            port=int("5000"),
            debug=True
            )

#    #Adding a new product to the database based on the URL
#    productAdd(db, urlDefault)
#    while True:
#        if checkPriceChange(db) == True:
#            print ("Price Drop!")
