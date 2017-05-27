//
//  DKeyModule.swift
//  ModuleDKey
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation
import CoreLibrary

let RequestKeyCompletedNotificationName = "RequestKeyCompletedNotificationName"

public class DKeyModule {
    
    public var delegate: DKeyDelegate?
    
    private var urlString: String
    
    
    public init(urlString: String) {
        self.urlString = urlString
        print("DKeyModule created")
        
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
    
    @objc func requestKeyCompleted(notification: Notification) {
        if let notificationObject = notification.object as? Stay {
            
            delegate?.requestKeyCompleted(stay: notificationObject)
            
        } else {
            delegate?.requestKeyCancelled()
        }
    }
}
