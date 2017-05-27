//
//  RequestKeyViewController.swift
//  ModuleDKey
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import UIKit
import CoreLibrary

class RequestKeyViewController: UIViewController {

    var stay: Stay!
    var welcomeMessage: String!
    @IBOutlet var welcomeLabel: UILabel!
    
    static func requestKeyController(for stay: Stay, welcomeMessage: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "RequestKey", bundle: Bundle(for: self))
        let navVC = storyboard.instantiateViewController(withIdentifier :"RequestKeyViewControllerNav") as! UINavigationController
        let vc = navVC.topViewController as! RequestKeyViewController
        vc.stay = stay
        vc.welcomeMessage = welcomeMessage
        return navVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = welcomeMessage
    }    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let vc = segue.destination as? RequestKeySubmissionViewController {
            vc.stay = stay
        }
    }

}

// This is just for convenience in this demo app
extension UIViewController {
    @IBAction func cancelRequestKey() {
        dismiss(animated: true) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: RequestKeyCompletedNotificationName), object: nil)
        }
    }
}

