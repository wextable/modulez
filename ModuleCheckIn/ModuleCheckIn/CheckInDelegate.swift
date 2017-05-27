//
//  CheckInDelegate.swift
//  ModuleCheckIn
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation
import CoreLibrary

public enum UserFlowEndReason: Int {
    case start
    case fail
    case cancel
    case success
}

public protocol CheckInDelegate {
    
    func checkInCompleted(stay: Stay, selectedTime: String, isUpgrade: Bool)
    
    func checkInCancelled()
    
    func creditCardSelectionViewController(with selectedCard: CreditCard, ctyhocn: String, cardSelectedClosure: (CreditCard) -> Void) -> UIViewController
    
    func remoteMessageViewController(message: String) -> UIViewController
    
    func webViewController(urlString: String) -> UIViewController
    
    func beginUserFlow(flowName: String)
    func endUserFlow(flowName: String, reason: UserFlowEndReason)
}
