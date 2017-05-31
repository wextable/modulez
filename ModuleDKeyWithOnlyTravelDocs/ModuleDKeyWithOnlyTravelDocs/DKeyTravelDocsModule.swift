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
    
    public func initialTravelDocsViewController(honorsId: String, stayId: String, ctyhocn: String, completion: (UIViewController?) ->  Void) {

        var travelDocsVC: UIViewController?
        
        if let delegate = apiDelegate {
            delegate.getTravelDocsForHotel(ctyhocn: ctyhocn) { json, error in
                
                // Pretending to parse JSON
                let areTravelDocsNeeded = true
                
                if areTravelDocsNeeded {
                    delegate.retrieveTravelDocsForGuest(honorsId: honorsId, stayId: stayId, completion: { (response: JSONDictionaryType?, _) in
                        travelDocsVC = TravelDocsViewController.travelDocsController(honorsId: honorsId, stayId: stayId, ctyhocn: ctyhocn, existingTD: response!)
                    })
                    
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
