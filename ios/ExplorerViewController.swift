//
//  ExplorerViewController.swift
//  PriceDrop
//
//  Created by Meera Rachamallu on 4/9/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class ExplorerViewController: UIViewController {

//nordstrom button
    
    @IBAction func nordstrom(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://shop.nordstrom.com/")!)
    }
    
    @IBAction func urbanoutfitters(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://www.urbanoutfitters.com/urban/index.jsp")!)
    }
    
    @IBAction func anthropologie(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "https://www.anthropologie.com/?cm_mmc=Google-_-US+-+Brand+-+Anthro+-+Exact-_-Brand-_-anthropologie&adpos=1t1&creative=137659599054&device=c&matchtype=e&network=g&gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvDCW3hElfT7mK1Lk1X1_HRVkSLosbgw2Ug6a_iuLJLQaAlZV8P8HAQ")!)
    }
    
    @IBAction func bcbg(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://www.bcbg.com/en/bcbghome/")!)
    }
    
    @IBAction func bloomingdales(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "https://www.bloomingdales.com/?&cm_mmc=google-_-Brand+Terms+-+Main-_-Brand+Terms+-+Bloomingdale%27s-_-s_187581274506&mkwid=s9UEy9vfw&pcrid=187581274506&pdv=c&&gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvHd4YFeunArto4oLKzxCrwY8DsvccJn2SXspEbJIOA4aAm6y8P8HAQ")!)
    }
    
    @IBAction func elle(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://www.elle.com/")!)
    }
    
    @IBAction func lululemon(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://shop.lululemon.com/?cid=Google:US11814_A165_A822_A002453&gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvHMRXcPPe271hSD6HGmDsTsAJhKmZcbe9SnBtVTtQwgaAm2s8P8HAQ")!)
    }
    
    
    @IBAction func michaelkors(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "https://www.michaelkors.com/?ecid=MKS_GOOGLE_US_Brand_MKO_GOO_ENGL_USA_NCA_T_E_CORE_michael%20kors&gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvCL_NwWmDydRr6r-R9vIiKStXQLqzSOnAQ1sJQl1xJYaAvWU8P8HAQ")!)
    }
    
    
    @IBAction func neimannmarcus(_ sender: UIButton) {
        
        UIApplication.shared.openURL(URL(string: "http://www.neimanmarcus.com/index.jsp?gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvOte75mg67aN79xbJQ2Nncrd-YKcetE5X1RTHCVHWlUaArjV8P8HAQ&ecid=NMPT__XX&gclsrc=aw.ds")!)
    }
    
    @IBAction func oakley(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://www.oakley.com/en?cm_mmc=google-semsearch-_-G-BRD-Low-Misc-Exact-_-U-Misspellings-_-oaklet&gclid=CPnflNzql9MCFQLCfgod4cMPeQ&gclsrc=ds")!)
    }
    
    @IBAction func patagonia(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://www.patagonia.com/shop/web-specials?utm_source=google&utm_medium=cpc&utm_campaign=Brand%20Core&utm_content=text%20ad&utm_term=patagonia&gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvChzIslZ0mNnPQhfsJPTj2Q97HS4rBtQLxpzl9_J4SEaAsr08P8HAQ")!)
    }
    
    @IBAction func ralphlauren(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://www.ralphlauren.com/home/index.jsp?ab=global_logo&utm_source=PaidSearch&utm_medium=Google&utm_campaign=Google-TM-Ralph+Lauren-Exact&utm_term=ralph+lauren&gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvOe5iQ9OImTuI4EeZs_M_oUBBPMrJTSty1yYIO-Bk5gaAuGL8P8HAQ")!)
    }
    
    @IBAction func nike(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://www.nike.com/us/en_us/?k_clickid=ebafc5ed-6539-45f4-895c-11b8edeec464&cp=usns_kw_nike_null_txt!g!c!br!e!nike")!)
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
