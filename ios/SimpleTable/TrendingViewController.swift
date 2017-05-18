//
//  TrendingViewController.swift
//  PriceDrop
//
//  Created by Meera Rachamallu on 4/9/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    
    @IBAction func UrbanLink2(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "https://www.freepeople.com/?cm_mmc=RKG-GoogleUS-_-Google-_-Brand-!Brand-_-freepeople&adpos=1t1&creative=109488056346&device=c&matchtype=b&network=g&gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvEJZog0H9OvImwx9wPKSvJNKxpmSqBlOPLSS2ZXPlqgaAkzR8P8HAQ")!)
    }
    
    @IBAction func UrbanLink(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "https://www.freepeople.com/?cm_mmc=RKG-GoogleUS-_-Google-_-Brand-!Brand-_-freepeople&adpos=1t1&creative=109488056346&device=c&matchtype=b&network=g&gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvEJZog0H9OvImwx9wPKSvJNKxpmSqBlOPLSS2ZXPlqgaAkzR8P8HAQ")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
