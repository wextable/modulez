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
    let segment: SegmentDetails
    let stay: Stay
    let checkInTime: String
    let isUpgrade: Bool
    
    init(segment: SegmentDetails, stay: Stay, checkInTime: String, isUpgrade: Bool) {
        self.segment = segment
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
    
    public func launchCheckIn(for segment: SegmentDetails, in stay: Stay, completion: (UIViewController?) ->  Void) {
        
        // Somewhere internal to the CheckInModule, we make the API call to get check in times, etc
        let apiCallSuccess = true
        
        var initialCheckInVC: UIViewController?
        if apiCallSuccess {
            // Then we create the check in VC and return it in the completion
            initialCheckInVC = CheckInViewController.checkInController(for: segment, in: stay)
        }
        completion(initialCheckInVC)
    }
    
    @objc func checkInCompleted(notification: Notification) {
        if let notificationObject = notification.object as? CheckInCompletedNotification {
            
            delegate?.checkInCompleted(for: notificationObject.segment, in: notificationObject.stay, selectedTime: notificationObject.checkInTime, isUpgrade: notificationObject.isUpgrade)
        } else {
            delegate?.checkInCancelled()
        }
    }
    
    
}
