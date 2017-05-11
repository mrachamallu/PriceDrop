import pyrebase
import requests
from bs4 import BeautifulSoup
import html5lib

email = "mrachamallu@gmail.com"
password = "ayush123"

#NORDSTROM FETCHER
urlDefault = "/Users/ayush/Documents/Development/PriceChange/website/nordstrom/index.html"

def priceFetch(url):
    try:
        price = BeautifulSoup(open(url), "html5lib").body.find("div", class_= "current-price").text
        return price[1:]
    except:
        return "Error: Couldn't fetch the price"

def productAdd(db, url):
    fetchedPrice = priceFetch(url)
    
    uploadData = {
        "NewPrice" : fetchedPrice,
        "OldPrice" : fetchedPrice,
        "URL" : url,
    }
    
    db.child("Data").child("Products").push(uploadData)

def checkPriceChange(db):
    productsData = db.child("Data").child("Products").get()
    
    for productData in productsData.each():
        fetchedPrice = priceFetch(productData.val()["URL"])
        if (float(fetchedPrice) < float(productData.val()["NewPrice"])):
            db.child("Data").child("Products").child(productData.key()).update({"NewPrice": fetchedPrice})
            return True
        else:
            return False


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

if __name__ == "__main__":
    #Initializing the firebase
    db = firebaseInitialize()
    
    #Adding a new product to the database based on the URL
    #productAdd(db, urlDefault)
    while True:
        if checkPriceChange(db) == True:
            print ("Price Drop!")
