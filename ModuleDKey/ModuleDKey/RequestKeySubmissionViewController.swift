//
//  RequestKeySubmissionViewController.swift
//  ModuleDKey
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import UIKit
import CoreLibrary

class RequestKeySubmissionViewController: UIViewController {

    var stay: Stay!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func submitRequestKey(sender: UIButton) {
        
        let didSucceed = true
        
        if didSucceed {
            dismiss(animated: true, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: RequestKeyCompletedNotificationName), object: stay)
        } else {
            print("Error trying to request key")
        }
        
    }
    
    
}
