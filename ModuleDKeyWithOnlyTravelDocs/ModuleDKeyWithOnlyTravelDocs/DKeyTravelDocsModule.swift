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
let TravelDocsCancelledNotificationName = "TravelDocsCancelledNotificationName"

public class DKeyTravelDocsModule {
    
    public var delegate: DKeyTravelDocsDelegate?
    public var apiDelegate: DKeyTravelDocsAPIDelegate?
    
    private var urlString: String
    
    
    public init(urlString: String) {
        self.urlString = urlString
        print("DKeyTravelDocsModule created")
        
        NotificationCenter.default.addObserver(self, selector: #selector(DKeyTravelDocsModule.travelDocsCompleted(notification:)), name: NSNotification.Name(rawValue: TravelDocsCompletedNotificationName), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DKeyTravelDocsModule.travelDocsCancelled(notification:)), name: NSNotification.Name(rawValue: TravelDocsCancelledNotificationName), object: nil)
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
                                            
                        if let tdForm = TravelDocsForm(json: response) {
                            travelDocsVC = TravelDocsViewController.travelDocsController(travelDocsForm: tdForm)
                        }
                        
                    })
                    
                }
            }
        }
        
        completion(travelDocsVC)
    }
    
    @objc func travelDocsCompleted(notification: Notification) {
        delegate?.travelDocsCompleted()
    }
    
    @objc func travelDocsCancelled(notification: Notification) {
        delegate?.travelDocsCancelled()
    }
}
