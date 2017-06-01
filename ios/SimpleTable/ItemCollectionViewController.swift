//
//  ItemCollectionViewController.swift
//  PriceDrop
//
//  Created by Meera Rachamallu on 5/24/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

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
    
    func parseJSON(jsonString: String)
    {
        if let jsonData = jsonString.data(using: .utf8, allowLossyConversion: false) {
            let json = JSON(data: jsonData)
            for (_, subJson):(String, JSON) in json {
                
                let title = String(describing: subJson["title"])
                let description = String(describing: subJson["description"])
                let url = String(describing: subJson["url"])
                let imageurl = String(describing: subJson["imageurl"])
                let originalprice = String(describing: subJson["originalprice"])
                let currentprice = String(describing: subJson["currentprice"])
                
                let hello = Item(title: title, description: description, url: url, imageurl: imageurl, originalprice: Double(originalprice)!, currentprice: Double(currentprice)!)
                itemSet.append(hello)
                
            }
        }
        
        collectionView?.reloadData()
        
    }
    
    //    func parseJSON(jsonString: String)
    //    {
    //        var title = ""
    //        var description = ""
    //        var url = ""
    //        var imageurl = ""
    //        var originalprice = ""
    //        var currentprice = ""
    //
    //        var encounteredError = false;
    //        var count = 0
    //
    //        for i in 0...jsonString.characters.count
    //        {
    //            if(jsonString[i-8..<i] == "imageurl")
    //            {
    //                for index in (i+3)...jsonString.characters.count
    //                {
    //                    if (encounteredError)
    //                    {
    //                        count += 1
    //                        if(count == 6)
    //                        {
    //                            encounteredError=false
    //                            count=0
    //                        }
    //                    }
    //                    if(jsonString[index] == "\"")
    //                    {
    //                        break;
    //                    }
    //                    if(index+6<jsonString.characters.count && jsonString[index..<index+6]=="\\u0026")
    //                    {
    //                        imageurl+="&"
    //                        encounteredError = true
    //                    }
    //                    if(!encounteredError){
    //                        imageurl+=jsonString[index]
    //                    }
    //                }
    //                //print(url)
    //                encounteredError = false;
    //                count = 0
    //            }
    //            if(jsonString[i-4..<i] == "\"url")
    //            {
    //                for index in (i+3)...jsonString.characters.count
    //                {
    //                    if (encounteredError)
    //                    {
    //                        count += 1
    //                        if(count == 6)
    //                        {
    //                            encounteredError=false
    //                            count=0
    //                        }
    //                    }
    //                    if(jsonString[index] == "\"")
    //                    {
    //                        break;
    //                    }
    //                    if(index+6<jsonString.characters.count && jsonString[index..<index+6]=="\\u0026")
    //                    {
    //                        url+="&"
    //                        encounteredError = true
    //                    }
    //                    if(!encounteredError){
    //                        url+=jsonString[index]
    //                    }
    //                }
    //                encounteredError = false;
    //                count = 0
    //            }
    //            if(jsonString[i-11..<i] == "description")
    //            {
    //                for index in (i+3)...jsonString.characters.count
    //                {
    //                    if(jsonString[index] == ",")
    //                    {
    //                        description = jsonString[i+3..<index-1];
    //                        break;
    //                    }
    //                }
    //            }
    //            if(jsonString[i-5..<i] == "title")
    //            {
    //                for index in (i+3)...jsonString.characters.count
    //                {
    //                    if(jsonString[index] == ",")
    //                    {
    //                        title = jsonString[i+3..<index-1];
    //                        break;
    //                    }
    //                }
    //            }
    //            if(jsonString[i-13..<i] == "originalprice")
    //            {
    //                for index in (i+2)...jsonString.characters.count
    //                {
    //                    if(jsonString[index] == ",")
    //                    {
    //                        originalprice = jsonString[i+2..<index];
    //                        break;
    //                    }
    //                }
    //            }
    //            if(jsonString[i-12..<i] == "currentprice")
    //            {
    //                for index in (i+2)...jsonString.characters.count
    //                {
    //                    if(jsonString[index] == "}")
    //                    {
    //                        currentprice = jsonString[i+2..<index];
    //                        let hello = Item(title: title, description: description, url: url, imageurl: imageurl, originalprice: Double(originalprice)!, currentprice: Double(currentprice)!)
    //                        itemSet.append(hello)
    //                        imageurl = ""
    //                        url = ""
    //                        break;
    //                    }
    //                }
    //            }
    //        }
    //        collectionView?.reloadData()
    //    }
    
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
        itemSet = []
        Alamofire.request("http://price-drop.herokuapp.com/api/items").responseString { response in
            //print(response.result)   // result of response serialization
            if let jsonString = response.result.value {
                //print(jsonString);
                self.parseJSON(jsonString: jsonString);
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
        let path = item.imageurl
        let imageurl = NSURL(string: path)
        let data = NSData(contentsOf: imageurl as! URL)
        let img = UIImage(data: data as! Data)
        
        cell.itemImageView.image = img
        cell.itemCurrentPrice.text = "\(item.currentprice)"
        cell.itemOriginalPrice.text = "\(item.originalprice)"
        cell.itemDescription.text = "\(item.description)"
        cell.itemTitle.text = "\(item.title)"
        if (item.currentprice == item.originalprice)
        {
            cell.itemPriceStatus.text = "no price drop"
        }
        else if (item.currentprice <= item.originalprice)
        {
            cell.itemPriceStatus.text = "price dropped!"
        }
        else if (item.currentprice >= item.originalprice)
        {
            cell.itemPriceStatus.text = "price rise :("
        }
        return cell
    }
    
    func CollectionView(_ CollectionVied: UICollectionView, didSelectRowAt indexPath: IndexPath) {
        var url : URL?
        
        switch indexPath.section{
        case 0:
            switch indexPath.row{
            case 1: break
            case 0:
                url = URL(string: "https://www.francescas.com")
                break
            case 2:
                url = URL(string: "http://www.prada.com/en.html?cc=US")
                break
            case 3:
                url = URL(string: "http://www.sperry.com/en/home")
                break
            case 4:
                url = URL(string: "https://www.zara.com")
                break
            case 5:
                url = URL(string: "http://shop.nordstrom.com")
                break
            case 6:
                url = URL(string: "https://www.freepeople.com")
                break
            default:
                return;
            }
            
            //        case 1:
            //            switch indexPath.row{
            //            case 0:
            //                url = URL(string: "https://www.google.com/")
            //            case 1:
            //                url = URL(string: "https://www.google.com/")
            //            default:
            //                return;
        //            }
        default:
            return;
        }
        
        if url != nil{
            UIApplication.shared.openURL(url!)
        }
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
