//
//  DKeyTravelDocsDelegate.swift
//  ModuleDKeyWithOnlyTravelDocs
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation
import CoreLibrary

public protocol DKeyTravelDocsDelegate {
    
    func travelDocsCompleted()
    
    func travelDocsCancelled()

}
