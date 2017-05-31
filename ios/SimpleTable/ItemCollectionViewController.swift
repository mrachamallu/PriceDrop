//
//  ItemCollectionViewController.swift
//  PriceDrop
//
//  Created by Meera Rachamallu on 5/24/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cell"

class ItemCollectionViewController: UICollectionViewController {

    private var itemSet: [Item] =
        []
    
    var itemSet2 = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func parseJSON(JSON: String)
    {
        var price = ""
        var url = ""
        
        for i in 0...JSON.characters.count
        {
            if(JSON[i-8..<i] == "imageurl")
            {
                for index in (i+3)...JSON.characters.count
                {
                    if(JSON[index] == "\"")
                    {
                        url = JSON[i+3..<index];
                        print(url);
                        break;
                    }
                }
            }
            if(JSON[i-13..<i] == "originalprice")
            {
                for index in (i+2)...JSON.characters.count
                {
                    if(JSON[index] == ",")
                    {
                        price = JSON[i+2..<index];
                        let hello = Item(name: "newItem", price: Double(price)!, description: "getDescription", brand: "brand", url: url)
                        itemSet.append(hello)
                        break;
                    }
                }
            }
        }
        collectionView?.reloadData()
    }
    
    func get_image(_ url_str:String, _ imageView:UIImageView)
    {
        
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if data != nil
            {
                let image = UIImage(data: data!)
    
                if(image != nil)
                {
                    DispatchQueue.main.async(execute: {
                        imageView.image = image
//                        UIView.animate(withDuration: 2.5, animations: {
//                            imageView.alpha = 1.0
//                        })
                    })
                }
            }
        })
        task.resume()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Alamofire.request("http://price-drop.herokuapp.com/api/items").responseString { response in
            print(response.result)   // result of response serialization
            if let JSON = response.result.value {
                print(JSON);
                self.parseJSON(JSON: JSON);
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//    
//        // Configure the cell
//    
//        return cell
//    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //returns # of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //returns # of items
        return itemSet.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        let item = itemSet[indexPath.row]
        
        //Download image using URL
        let path = item.url
        let url = NSURL(string: path)
        let data = NSData(contentsOf: url as! URL)
        let img = UIImage(data: data as! Data)
        
        cell.itemImageView.image = img
        cell.itemPriceLabel.text = "$\(item.price)"
        cell.itemBrandLabel.text = "$\(item.brand)"
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
