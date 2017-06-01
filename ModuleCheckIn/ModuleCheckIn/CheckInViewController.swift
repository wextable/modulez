//
//  CheckInViewController.swift
//  ModuleCheckIn
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//


import CoreLibrary

class CheckInViewController: UIViewController {
    
    var segment: Segment!
    var stay: Stay!
    
    static func checkInController(for segment: Segment, in stay: Stay) -> UIViewController {
        let storyboard = UIStoryboard(name: "CheckIn", bundle: Bundle(for: self))
        let navVC = storyboard.instantiateViewController(withIdentifier :"CheckInViewControllerNav") as! UINavigationController
        let vc = navVC.topViewController as! CheckInViewController
        vc.segment = segment
        vc.stay = stay
        return navVC
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let vc = segue.destination as? CheckInSubmissionViewController {
            print("Selected a room, pushing to Check In Submission  ")
            vc.segment = segment
            vc.stay = stay
        }
    }
    
    
}

// This is just for convenience in this demo app
extension UIViewController {
    @IBAction func cancelCheckIn() {
        dismiss(animated: true) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: CheckInCompletedNotificationName), object: nil)
        }        
    }
}
