//
//  CheckInStayProtocol.swift
//  ModuleCheckIn
//
//  Created by Wesley St. John on 5/26/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation

public protocol CheckInHotel {
    var ctyhocn: String { get set }
    var name: String { get set }
}

public protocol CheckInStay {
    var confirmationNumber: String { get set }
    var hotel: CheckInHotel { get set }
}
