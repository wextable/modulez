//
//  StayCardViewController.swift
//  ModulezApp
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import UIKit
import CoreLibrary

class StayCardViewController: UIViewController {

    var stay: Stay?
    @IBOutlet var label: UILabel!
    @IBOutlet var checkInButton: UIButton!
    @IBOutlet var requestKeyButton: UIButton!
    
    static func stayCardController(for stay: Stay) -> UIViewController {
        let storyboard = UIStoryboard(name: "Stays", bundle: Bundle(for: self))
        let vc = storyboard.instantiateViewController(withIdentifier :"StayCardViewController") as! StayCardViewController
        vc.stay = stay
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = stay?.hotel.name
        
//        checkInButton.isHidden = (checkInModule == nil)
//        requestKeyButton.isHidden = (dKeyModule == nil)
    }

    @IBAction private func launchCheckIn(sender: UIButton) {
        if let stay = stay {
            NotificationCenter.default.post(name: Notification.Name(rawValue: LaunchCheckInNotificationName), object: stay)
        }
    }

    @IBAction private func launchRequestKey(sender: UIButton) {
        if let stay = stay {
            NotificationCenter.default.post(name: Notification.Name(rawValue: LaunchRequestKeyNotificationName), object: stay)
        }
    }
    
}



