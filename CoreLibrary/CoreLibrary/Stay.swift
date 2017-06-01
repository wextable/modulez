//
//  Stay.swift
//  CoreLibrary
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation

public class Stay {
    public var confirmationNumber: String = "12345678"
    public var hotel: Hotel = Hotel()
    public var segments: [Segment] = [Segment()]
    
    public init() {
        
    }
    
    public init(confirmationNumber: String, hotel: Hotel) {
        self.confirmationNumber = confirmationNumber
        self.hotel = hotel
    }
}


