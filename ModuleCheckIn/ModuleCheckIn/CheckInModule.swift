//
//  CheckInModule.swift
//  ModuleCheckIn
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation
import CoreLibrary

let CheckInCompletedNotificationName = "CheckInCompletedNotification"

struct CheckInCompletedNotification {
    let stay: CheckInStay
    let checkInTime: String
    let isUpgrade: Bool
    
    init(stay: CheckInStay, checkInTime: String, isUpgrade: Bool) {
        self.stay = stay
        self.checkInTime = checkInTime
        self.isUpgrade = isUpgrade
    }
}

public class CheckInModule {
    
    public var delegate: CheckInDelegate?
    
    private var urlString: String
    
    
    public init(urlString: String) {
        self.urlString = urlString
        print("CheckInModule created")
        
        NotificationCenter.default.addObserver(self, selector: #selector(CheckInModule.checkInCompleted(notification:)), name: NSNotification.Name(rawValue: CheckInCompletedNotificationName), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func launchCheckIn(for stay: CheckInStay) -> UIViewController {
        let initialCheckInVC = CheckInViewController.checkInController(for: stay)
        return initialCheckInVC
    }
    
    @objc func checkInCompleted(notification: Notification) {
        if let notificationObject = notification.object as? CheckInCompletedNotification {
            
            delegate?.checkInCompleted(stay: notificationObject.stay, selectedTime: notificationObject.checkInTime, isUpgrade: notificationObject.isUpgrade)
        } else {
            delegate?.checkInCancelled()
        }
    }
    
    
}
