//
//  Member.swift
//  CoreLibrary
//
//  Created by Jim Diep on 5/27/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation

public class Member {
    public var honorsId: String = "7598402112"
    public var creditCard: CreditCard?
    public var travelDocs: [String: Any]?
    
    public init() {
        
    }
    
    public init(honorsId: String) {
        self.honorsId = honorsId
    }
}
