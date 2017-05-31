//
//  TravelDocsViewController.swift
//  ModuleDKeyWithOnlyTravelDocs
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import UIKit
import CoreLibrary

class TravelDocsViewController: UIViewController {

    var travelDocsForm: TravelDocsForm!
    
    static func travelDocsController(travelDocsForm: TravelDocsForm) -> UIViewController {
        let storyboard = UIStoryboard(name: "TravelDocs", bundle: Bundle(for: self))
        let vc = storyboard.instantiateViewController(withIdentifier :"TravelDocsViewController") as! TravelDocsViewController
        vc.travelDocsForm = travelDocsForm
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func submitTravelDocs(sender: UIButton) {        
        let didSucceed = true
        
        if didSucceed {
            print("Travel Docs submitted")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: TravelDocsCompletedNotificationName), object: nil)
        } else {
            print("Error trying to submit travel docs")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let vc = segue.destination as? TravelDocsFormViewController {
            print("Entering guest info")
            vc.travelDocsForm = travelDocsForm
            vc.guestId = "1"
        }
    }
    
}


// This is just for convenience in this demo app
extension UIViewController {
    @IBAction func cancelTravelDocs() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: TravelDocsCancelledNotificationName), object: nil)
    }
}
