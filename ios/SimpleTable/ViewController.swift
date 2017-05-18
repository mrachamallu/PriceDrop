//
//  ViewController.swift
//  SimpleTable
//
//  Created by Meera Rachamallu on 4/8/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class ourViewController: UIViewController {
    
    var gameTimer: Timer!
    var picTimer: Timer!
    var isRunning = true;
    var counter = 0;
    
    @IBOutlet weak var priceDropImageLogo: UIImageView!
    
    var logoImages = ["hat", "bag","mensclothing","watch","music","couch"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeImage(){
        let image = UIImage(named: logoImages[counter]);
        self.priceDropImageLogo.image = image;
        counter += 1;
        if(counter >= logoImages.count){
            counter = 0;
        }
    }
}

//class ViewController:


//    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
//    
//    var restaurantImages = ["barrafina", "restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","restaurant","wafflewolf",]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
//        Int {
//                return restaurantNames.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
//    UITableViewCell{
//        let cellIdentifier = "Cell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
//                                                 for: indexPath)
//        
//        cell.textLabel?.text = restaurantNames[indexPath.row]
//        
//        cell.imageView?.image = UIImage(named: restaurantImages[indexPath.row])
//        return cell
//    }
//    
    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        //#warning Incomplete method implementation -- Return the number of items in the section
//        return restaurantImages.count
//    }
//    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withIdentifier, for: indexPath) as MyCollectionViewCell
//        
//        // Configure the cell
//        let image = UIImage(named: restaurantImages[indexPath.row])
//        cell.imageView.image = image
//        return cell
//    }
//    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    


