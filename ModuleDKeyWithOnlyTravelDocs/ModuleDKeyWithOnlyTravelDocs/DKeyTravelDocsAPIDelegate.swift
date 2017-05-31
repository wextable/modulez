//
//  DKeyTravelDocsAPIDelegate.swift
//  ModuleDKeyWithOnlyTravelDocs
//
//  Created by Wesley St. John on 5/27/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import Foundation


// This will eventually move back into the DK module
// But for now we will delegate the responsibility of making API calls

public typealias JSONDictionaryType = [String: Any]
public typealias APIClientResponseClosure = ((JSONDictionaryType?, APIClientError?) -> Void)


public enum APIClientError: Error {
    case unknownError
    case httpError(domain: String, code: Int, userInfo: [AnyHashable: Any])
    case jsonDecodingError
}

public protocol DKeyTravelDocsAPIDelegate {
    
    func getTravelDocsForHotel(ctyhocn: String, completion: APIClientResponseClosure)
    
    //travel docs for stay
    func retrieveTravelDocsForGuest(honorsId: String, stayId: String, completion: APIClientResponseClosure)
    func createTravelDocsForGuest(honorsId: String, stayId: String, travelDocs: [String: Any], completion: APIClientResponseClosure)
    func modifyTravelDocsForGuest(honorsId: String, stayId: String, travelDocs: [String: Any], completion: APIClientResponseClosure)
    
    //save to memberAccount
    func createTravelDocsForPrimaryGuest(honorsId: String, travelDocs: [String: Any], completion: APIClientResponseClosure)
    func modifyTravelDocsForPrimaryGuest(honorsId: String, travelDocs: [String: Any], completion: APIClientResponseClosure)
    
    //travel docs info for a Honors member
    func retrieveTravelDocsForGuest(honorsId: String, completion: APIClientResponseClosure)
    
}
