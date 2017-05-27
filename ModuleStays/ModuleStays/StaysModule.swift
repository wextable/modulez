//
//  DKeyModule.swift
//  ModuleDKey
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation
import CoreLibrary

let LaunchCheckInNotificationName = "LaunchCheckInNotificationName"
let LaunchRequestKeyNotificationName = "LaunchRequestKeyNotificationName"

public class StaysModule {
    
    public var delegate: StaysDelegate?
    
    private var urlString: String
    
    public init(urlString: String) {
        self.urlString = urlString
        print("StaysModule created")
        
        NotificationCenter.default.addObserver(self, selector: #selector(StaysModule.launchCheckIn(notification:)), name: NSNotification.Name(rawValue: LaunchCheckInNotificationName), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(StaysModule.launchRequestKey(notification:)), name: NSNotification.Name(rawValue: LaunchRequestKeyNotificationName), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func launchStayCard(for stay: Stay) -> UIViewController {
        return StayCardViewController.stayCardController(for: stay)
    }
    
    @objc private func launchCheckIn(notification: Notification) {
        if let notificationObject = notification.object as? Stay {
            delegate?.launchCheckIn(for: notificationObject)
        }
    }
    
    @objc private func launchRequestKey(notification: Notification) {
        if let notificationObject = notification.object as? Stay {
            delegate?.launchRequestKey(for: notificationObject, welcomeMessage: nil)
        }
    }
}
