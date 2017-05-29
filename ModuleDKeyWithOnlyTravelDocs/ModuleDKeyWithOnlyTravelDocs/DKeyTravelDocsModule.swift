//
//  DKeyTravelDocsModule.swift
//  ModuleDKeyWithOnlyTravelDocs
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation
import CoreLibrary

let TravelDocsCompletedNotificationName = "TravelDocsCompletedNotificationName"

public class DKeyTravelDocsModule {
    
    public var delegate: DKeyTravelDocsDelegate?
    public var apiDelegate: DKeyTravelDocsAPIDelegate?
    
    private var urlString: String
    
    
    public init(urlString: String) {
        self.urlString = urlString
        print("DKeyTravelDocsModule created")
        
        NotificationCenter.default.addObserver(self, selector: #selector(DKeyTravelDocsModule.travelDocsCompleted(notification:)), name: NSNotification.Name(rawValue: TravelDocsCompletedNotificationName), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func initialTravelDocsViewController(for stay: Stay, completion: (UIViewController?) ->  Void) {

        var travelDocsVC: UIViewController?
        
        if let delegate = apiDelegate {
            delegate.getTravelDocsForHotel(ctyhocn: ""/*stay.ctyhocn*/) { json, error in
                
                // Pretending to parse JSON
                let areTravelDocsNeeded = true
                
                if areTravelDocsNeeded {
                    travelDocsVC = TravelDocsViewController.travelDocsController(for: stay)
                }
            }
        }
        
        completion(travelDocsVC)
    }
    
    @objc func travelDocsCompleted(notification: Notification) {
        if let notificationObject = notification.object as? Stay {
            
            delegate?.travelDocsCompleted(stay: notificationObject)
            
        } else {
            delegate?.travelDocsCancelled()
        }
    }
}
