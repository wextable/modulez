//
//  DKeyDelegate.swift
//  ModuleDKey
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation
import CoreLibrary

public protocol DKeyDelegate {
    
    // Once the entire S2R/DK module is extracted to the pod, this will be handled internally
    func travelDocsViewController(for stay: Stay, completion: (UIViewController?) ->  Void)
    
    func requestKeyCompleted(stay: Stay)
    
    func requestKeyCancelled()
}
