import requests
from bs4 import BeautifulSoup
import html5lib

url = 'http://shop.nordstrom.com/s/robin-piccone-plunge-one-piece-swimsuit/4590515?origin=category-personalizedsort&fashioncolor=INDIGO%20MULTI'

def priceFetch(url):
    try:
        webpage = requests.get(url)
        price = BeautifulSoup(webpage.text, 'html5lib').body.find("div", class_= 'current-price').text
        return price
    except:
        return "Error: Couldn't fetch the price"


if __name__ == "__main__":
    print priceFetch(url)
