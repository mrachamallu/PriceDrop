import pyrebase
import requests
from bs4 import BeautifulSoup
import html5lib

email = "mrachamallu@gmail.com"
password = "ayush123"

#NORDSTROM FETCHER
urlDefault = ""

def priceFetch(url):
    try:
        webpage = requests.get(url)
        price = BeautifulSoup(webpage.text, 'html5lib').body.find("div", class_= 'current-price').text
        return price
    except:
        return "Error: Couldn't fetch the price"

def productAdd(db, url):
    
    fetchedPrice = priceFetch(url)
    
    uploadData = {
        "NewPrice" : 179.00,
        "OldPrice" : fetchedPrice[1:],
        "URL" : url,
    }
    
    db.child("Data").child("Products").push(uploadData)

def checkPriceChange(db):
    productsData = db.child("Data").child("Products").get()
    
    for productData in productsData.each():
        fetchedPrice = priceFetch(productData.val()['URL'])[1:]
        if (float(fetchedPrice) < productData.val()['NewPrice']):
            
            print ("Price Drop!")


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
    productAdd(db, urlDefault)
    checkPriceChange(db)
