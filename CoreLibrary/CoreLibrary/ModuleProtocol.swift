//
//  ModuleProtocol.swift
//  CoreLibrary
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation

public protocol ModuleProtocol {
    
//    func init(apiClient: APIClient???)
    func configure()
    func start()
    func stop()
}
