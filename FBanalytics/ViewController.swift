//
//  ViewController.swift
//  FBanalytics
//
//  Created by Harshvardhan Agarwal on 26/08/17.
//  Copyright © 2017 Purushotham. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Analytics Demo"
    
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func logTitle(_ sender: Any) {
        
        Analytics.logEvent(AnalyticsEventSelectContent, parameters:
            [AnalyticsParameterItemID: "id -\(title!)" as NSObject,
             AnalyticsParameterItemName: "\(title!)" as NSObject,
             AnalyticsParameterContent: "cont" as NSObject
            ])
         print("Custom selection saved")
    }

    @IBAction func logCustomEvent(_ sender: Any) {
        
        let name = "~Pizza",
        text = "I'd love you to hear about\(name)"
        
        Analytics.logEvent("share_image", parameters: [
            "name": name as NSObject,
            "full_text": text as NSObject
            ])
      print("Custom Event saved")
    }
    
    @IBAction func logs_current_screen(_ sender: Any) {
        guard let screenName = title else {
            return
        }
        let screenClass = classForCoder.description()
        
        Analytics.setScreenName(screenName, screenClass: screenClass)
      
        print("Current screenName saved")
    }
    
    @IBAction func logEvent(_ sender: Any) {
        let food = "Hamburger"
        Analytics.setUserProperty(food, forName: "favorite_food")
        
        print("UserProperty saved")
    }
   
}

