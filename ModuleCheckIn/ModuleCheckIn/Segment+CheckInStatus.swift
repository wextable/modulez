//
//  Segment+CheckIn.swift
//  Pods
//
//  Created by Wesley St. John on 5/31/17.
//
//

import Foundation
import CoreLibrary

extension Segment: CheckInStatusProtocol {
    public func checkInStatus() -> CheckInStatus {
        return .available
    }
}
