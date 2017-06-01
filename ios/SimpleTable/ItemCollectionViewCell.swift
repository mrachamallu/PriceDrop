//
//  ItemCollectionViewCell.swift
//  PriceDrop
//
//  Created by Meera Rachamallu on 5/24/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var itemDescription: UILabel!
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemOriginalPrice: UILabel!
    @IBOutlet var itemCurrentPrice: UILabel!
    @IBOutlet var itemPriceStatus: UILabel!
}
