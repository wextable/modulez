//
//  TravelDocsForm.swift
//  Pods
//
//  Created by Wesley St. John on 5/30/17.
//
//

import Foundation

struct TravelDocsForm {
    var stayId: String?
    
    init?(json: JSONDictionaryType?) {
        if let json = json {
            stayId = "123"
        } else {
            return nil
        }
    }
    
}
