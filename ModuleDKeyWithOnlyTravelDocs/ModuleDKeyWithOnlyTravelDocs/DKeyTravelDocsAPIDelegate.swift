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
    func retrieveTravelDocsForGuest(honorsId: String, confirmationNumber: String, completion: APIClientResponseClosure)
    func createTravelDocsForGuest(honorsId: String, confirmationNumber: String, primaryGuestInfo: [String: Any], additionalGuestsInfo: [String: Any]?, completion: APIClientResponseClosure)
    func modifyTravelDocsForGuest(honorsId: String, confirmationNumber: String, primaryGuestInfo: [String: Any], additionalGuestsInfo: [String: Any]?, completion: APIClientResponseClosure)
    
    //save to memberAccount
    func createTravelDocsForPrimaryGuest(honorsId: String, primaryGuestInfo: [String: Any], completion: APIClientResponseClosure)
    func modifyTravelDocsForPrimaryGuest(honorsId: String, primaryGuestInfo: [String: Any], completion: APIClientResponseClosure)
}
