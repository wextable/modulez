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
    public var segments: [SegmentDetails] = [SegmentDetails]()
    public var stayId: String = "123"
    
    public init() {
        
    }
    
    public init(confirmationNumber: String, hotel: Hotel) {
        self.confirmationNumber = confirmationNumber
        self.hotel = hotel
    }
}

public class SegmentDetails {
    
    public var adults: Int = 1
    public var children: Int = 0
    
    public init() {
        
    }
}
