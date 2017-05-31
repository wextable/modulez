//
//  APIClient.swift
//  ModulezApp
//
//  Created by Jim Diep on 5/27/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation
import CoreLibrary

public typealias JSONDictionaryType = [String: Any]

public class APIClient {
    
    //request travel doc requirements
    public func getTravelDocForms(ctyhocn: String) -> JSONDictionaryType {
        return [
            "Response" : [
                "TravelDocsRequiredForCheckin": true,
                "PrimaryGuestDocs": true
            ]
        ]
    }
    
    //travel docs for stay
    public func getTravelDocForGuest(honorsId: String, stayId: String) -> JSONDictionaryType {
        return [
            "TravelDocs" : [
                "IdType": "Visa",
                "PassportIdNumber": "292929292929",
                "PlaceofIssue": "IND",
                "NextDestination": ""
            ]
        ]
    }	

    public func postTravelDocsForGuest(honorsId: String, stayId: String, travelDocs: [String : Any]) -> JSONDictionaryType {
        return ["Reponse" : "Success"]
    }
    
    public func putTravelDocsForGuest(honorsId: String, stayId: String, travelDocs: [String : Any]) -> JSONDictionaryType {
        return ["Reponse" : "Success"]
    }
    
    
    //travel docs for guest
    public func postTravelDocsForPrimaryGuest(honorsId: String, travelDocs: [String : Any]) -> JSONDictionaryType {
        return ["Reponse" : "Success"]
    }
    
    public func putTravelDocsForPrimaryGuest(honorsId: String, travelDocs: [String : Any]) -> JSONDictionaryType {
        return ["Reponse" : "Success"]
    }
    
    //travel docs for stay
    public func getTravelDocForGuest(honorsId: String) -> JSONDictionaryType {
        return [
            "TravelDocs" : [
                "IdType": "Visa",
                "PassportIdNumber": "292929292929",
                "PlaceofIssue": "IND",
            ]
        ]
    }
}
