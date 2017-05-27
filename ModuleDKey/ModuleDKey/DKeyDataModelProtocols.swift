//
//  DKeyDataModelProtocols.swift
//  ModuleCheckIn
//
//  Created by Wesley St. John on 5/26/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation

public protocol DKeyHotel {
    var ctyhocn: String { get set }
    var name: String { get set }
    var isDKeyEnabled: Bool { get set }
}

public protocol DKeyStay {
    var confirmationNumber: String { get set }
    var hotel: DKeyHotel { get set }
}
