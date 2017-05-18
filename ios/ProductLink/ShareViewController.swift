//
//  ShareViewController.swift
//  ProductLink
//
//  Created by Meera Rachamallu on 4/8/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import Social

class ShareViewController: UIViewController {
    
    override func viewDidLoad() {
        
        var request = URLRequest(url: URL(string: "http://localhost:5000/upload")!)
        request.httpMethod = "POST"
        let postString = "URL=http://localhost:5000/website/nordstrom"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
        }
        task.resume()
        
        extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
}

//class ShareViewController: SLComposeServiceViewController {
//
//    override func isContentValid() -> Bool {
//        // Do validation of contentText and/or NSExtensionContext attachments here
//        return true
//    }
//
//    override func didSelectPost() {
//        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
//
//        var request = URLRequest(url: URL(string: "http://localhost:5000/upload")!)
//        request.httpMethod = "POST"
//        let postString = "URL=/Users/ayush/Documents/Development/PriceChange/website/nordstrom/index.html"
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {                                                 // check for fundamental networking error
//                print("error=\(String(describing: error))")
//                return
//            }
//
//            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(String(describing: response))")
//            }
//
//            let responseString = String(data: data, encoding: .utf8)
//            print("responseString = \(String(describing: responseString))")
//        }
//        task.resume()
//
////GET DATA
////        let url = URL(string: "https://httpbin.org/ip")
////
////        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
////            guard error == nil else {
////                print(error!)
////                return
////            }
////            guard let data = data else {
////                print("Data is empty")
////                return
////            }
////
////            let json = try! JSONSerialization.jsonObject(with: data, options: [])
////            print(json)
////        }
////
////        task.resume()
//
//        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
//        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
//    }
//
//    override func configurationItems() -> [Any]! {
//
////        self.item = SLComposeSheetConfigurationItem()
////        self.item.title = "Team"
////        self.item.value = "None"
////
////        self.item.tapHandler = {
////            // TBA
////        }
////        return [self.item]
//
//        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
//        return []
//    }
//
//}
