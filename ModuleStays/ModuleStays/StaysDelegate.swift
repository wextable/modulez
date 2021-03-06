//
//  DKeyDelegate.swift
//  ModuleDKey
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation
import CoreLibrary

public protocol StaysDelegate {
    
    func launchCheckIn(for stay: Stay)
    
    func launchRequestKey(for stay: Stay, welcomeMessage: String?)
}
