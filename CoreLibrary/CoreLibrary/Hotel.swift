//
//  Hotel.swift
//  CoreLibrary
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation

public class Hotel {
    public var ctyhocn: String = "DCAOTHF"
    public var name: String = "Hilton Alexandria"
    public var isDKeyEnabled: Bool = false

    public init() {
        
    }
    
    public init(ctyhocn: String, name: String, isDKeyEnabled: Bool) {
        self.ctyhocn = ctyhocn
        self.name = name
        self.isDKeyEnabled = isDKeyEnabled
    }
}
