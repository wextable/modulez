//
//  Stay+DKeyStatus.swift
//  Pods
//
//  Created by Wesley St. John on 5/31/17.
//
//

import Foundation
import CoreLibrary

extension Stay: DKeyStatusProtocol {
    public func dKeyStatus() -> DKeyStatus {
        
        var segmentStatuses: [DKeyStatus] = []
        for segment in segments {
            segmentStatuses.append(segment.dKeyStatus())
        }
        
        if segmentStatuses.contains(.available) {
            return .available
        }
                
        return segmentStatuses.first!
    }
}
