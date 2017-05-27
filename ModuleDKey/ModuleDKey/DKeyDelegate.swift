//
//  DKeyDelegate.swift
//  ModuleDKey
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation

public protocol DKeyDelegate {
    
    func requestKeyCompleted(stay: DKeyStay)
    
    func requestKeyCancelled()
}
