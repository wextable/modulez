//
//  CheckInSubmissionViewController.swift
//  ModuleCheckIn
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import UIKit
import CoreLibrary

class CheckInSubmissionViewController: UIViewController {

    var stay: Stay!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func submitCheckIn(sender: UIButton) {
        
        let didSucceed = true
        let isUpgrade = true
        let checkInTime = "4pm"
        
        if didSucceed {
            print("Check in completed!")
            dismiss(animated: true, completion: nil)
            let notificationObject = CheckInCompletedNotification(stay: stay, checkInTime: checkInTime, isUpgrade: isUpgrade)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: CheckInCompletedNotificationName), object: notificationObject)
        } else {
            print("Error trying to check in")
        }
        
    }



}
