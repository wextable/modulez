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

    var segment: Segment!
    var stay: Stay!
    var welcomeMessage: String!
    var honorsId: String!
    
    @IBOutlet var welcomeLabel: UILabel!
    
    static func requestKeyController(for segment: Segment, in stay: Stay, honorsId: String, welcomeMessage: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "RequestKey", bundle: Bundle(for: self))
        let navVC = storyboard.instantiateViewController(withIdentifier :"RequestKeyViewControllerNav") as! UINavigationController
        let vc = navVC.topViewController as! RequestKeyViewController
    
        vc.segment = segment
        vc.stay = stay
        vc.honorsId = honorsId
        vc.welcomeMessage = welcomeMessage
        return navVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = welcomeMessage
        
        NotificationCenter.default.addObserver(self, selector: #selector(RequestKeyViewController.gotInitialTravelDocsViewController(notification:)), name: NSNotification.Name(rawValue: InitialTravelDocsViewControllerNotificationName), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(RequestKeyViewController.readyToSubmitRequestKey(notification:)), name: NSNotification.Name(rawValue: ReadyToSubmitRequestKeyNotificationName), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(RequestKeyViewController.readyToOptInForRequestKey(notification:)), name: NSNotification.Name(rawValue: ReadyToOptInForRequestKeyNotificationName), object: nil)
    }
    
    @IBAction private func startTravelDocsFlow(sender: UIButton) {
        print("Checking to see if we need Travel Docs")
        
        let travelDocData: [String: Any] = ["honorsId": honorsId, "stayId": stay.segments.first!.stayId, "ctyhocn": stay.hotel.ctyhocn]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: StartTravelDocsFlowNotificationName), object: nil, userInfo: travelDocData)
    }
    
    @objc func gotInitialTravelDocsViewController(notification: Notification) {
        if let notificationObject = notification.object as? UIViewController {
            print("We got a Travel Docs VC, so pushing it...")
            navigationController?.pushViewController(notificationObject, animated: true)
        } else {
            // We can skip travel docs, so go straight to submission
            print("We did NOT get a Travel Docs VC, so skipping to submission...")
            let requestKeySubmissionVC = RequestKeySubmissionViewController.requestKeySubmissionController(for: stay)
            navigationController?.pushViewController(requestKeySubmissionVC, animated: true)
        }
    }

    @objc func readyToSubmitRequestKey(notification: Notification) {
        print("Done with travel docs, so go to submission")
        let requestKeySubmissionVC = RequestKeySubmissionViewController.requestKeySubmissionController(for: stay)
        navigationController?.pushViewController(requestKeySubmissionVC, animated: true)
    }
    
    @objc func readyToOptInForRequestKey(notification: Notification) {
        print("They cancelled Travel Docs VC, so let's pop")
        navigationController?.popViewController(animated: true)
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

