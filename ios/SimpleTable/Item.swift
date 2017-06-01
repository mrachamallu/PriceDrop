//
//  Item.swift
//  PriceDrop
//
//  Created by Meera Rachamallu on 5/24/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation

struct Item {
    var title: String = ""
    var description: String = ""
    var url: String = ""
    var imageurl: String = ""
    var originalprice: Double = 0.0
    var currentprice: Double = 0.0
    
    init(title: String, description: String, url: String, imageurl: String, originalprice: Double, currentprice: Double) {
        self.title = title
        self.description = description
        self.url = url
        self.imageurl = imageurl
        self.originalprice = originalprice
        self.currentprice = currentprice
    }
}

