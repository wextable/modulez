//
//  DKeyStatus.swift
//  Pods
//
//  Created by Wesley St. John on 5/31/17.
//
//

import Foundation

public enum DKeyStatus {
    case unknown
    case canRequest
    case requested
    case provisioned
    case available
    case conflict
    case tooLateToRequest
    case failure
    case checkedOut
}

public protocol DKeyStatusProtocol {
    func dKeyStatus() -> DKeyStatus
}
