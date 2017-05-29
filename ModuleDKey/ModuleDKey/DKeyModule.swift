//
//  DKeyModule.swift
//  ModuleDKey
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation
import CoreLibrary

let StartTravelDocsFlowNotificationName = "StartTravelDocsFlowNotificationName"
let InitialTravelDocsViewControllerNotificationName = "InitialTravelDocsViewControllerNotificationName"
let TravelDocsCompletedNotificationName = "TravelDocsCompletedNotificationName"
let TravelDocsCancelledNotificationName = "TravelDocsCancelledNotificationName"
let RequestKeyCompletedNotificationName = "RequestKeyCompletedNotificationName"

public class DKeyModule {
    
    public var delegate: DKeyDelegate?
    
    private var urlString: String
    
    
    public init(urlString: String) {
        self.urlString = urlString
        print("DKeyModule created")
        
        NotificationCenter.default.addObserver(self, selector: #selector(DKeyModule.startTravelDocsFlow(notification:)), name: NSNotification.Name(rawValue: StartTravelDocsFlowNotificationName), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DKeyModule.requestKeyCompleted(notification:)), name: NSNotification.Name(rawValue: RequestKeyCompletedNotificationName), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func launchRequestKey(for stay: Stay, welcomeMessage: String?) -> UIViewController {
        let message = welcomeMessage ?? "Digital keys are the best"
        
        let initialRequestKeyVC = RequestKeyViewController.requestKeyController(for: stay, welcomeMessage: message)
        return initialRequestKeyVC
    }
    
    public func travelDocsCompleted() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: TravelDocsCompletedNotificationName), object: nil)
    }
    
    public func travelDocsCancelled() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: TravelDocsCancelledNotificationName), object: nil)
    }
    
    @objc func startTravelDocsFlow(notification: Notification) {
        if let notificationObject = notification.object as? Stay {
            
            delegate?.travelDocsViewController(for: notificationObject) { viewController in
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: InitialTravelDocsViewControllerNotificationName), object: viewController)
            }
        }
    }
    
    @objc func requestKeyCompleted(notification: Notification) {
        if let notificationObject = notification.object as? Stay {
            
            delegate?.requestKeyCompleted(stay: notificationObject)
            
        } else {
            delegate?.requestKeyCancelled()
        }
    }
}
