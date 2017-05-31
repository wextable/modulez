//
//  AppDelegate.swift
//  ModulezApp
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import UIKit
import CoreLibrary
import ModuleCheckIn
import ModuleDKey
import ModuleDKeyWithOnlyTravelDocs
import ModuleStays

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var checkInModule: CheckInModule!
    var dKeyModule: DKeyModule!
    var dKeyWithOnlyTravelDocsModule: DKeyTravelDocsModule!
    var staysModule: StaysModule!
    var apiClient: APIClient = APIClient()
    var member: Member = Member(honorsId: "123456")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupModules()        
        stubInitialVC()
        
        return true
    }

    func setupModules() {
        setupCheckInModule()
        setupDKeyModule()
        setupDKeyWithOnlyTravelDocsModule()
        setupStaysModule()
    }
    
    func setupCheckInModule() {
        checkInModule = CheckInModule(urlString: "honors/v1/checkIn")
        checkInModule.delegate = self
    }
    
    func setupDKeyModule() {
        dKeyModule =  DKeyModule(urlString: "whatevs")
        dKeyModule.delegate = self
    }

    func setupDKeyWithOnlyTravelDocsModule() {
        dKeyWithOnlyTravelDocsModule = DKeyTravelDocsModule(urlString: "whatevs")
        dKeyWithOnlyTravelDocsModule.delegate = self
        dKeyWithOnlyTravelDocsModule.apiDelegate = self
    }
    
    func setupStaysModule() {
        staysModule = StaysModule(urlString: "I wonder what we should init with?")
        staysModule.delegate = self
    }
    
    func rootVC() -> UIViewController? {
        if let w = window,
            let rvc = w.rootViewController  {
            return rvc
        }
        return nil
    }

    func stubInitialVC() {
        let hotel = Hotel(ctyhocn: "DCAOTHF", name: "Hilton Alexandria", isDKeyEnabled: true)
        let stay = Stay(confirmationNumber: "12345678", hotel: hotel)
        let stayCardVC = staysModule.launchStayCard(for: stay)
        if let w = window {
            w.rootViewController = stayCardVC
        }
    }
}


// MARK: CheckInDelegate

extension AppDelegate: CheckInDelegate {
    
    public func checkInCompleted(for segment: SegmentDetails, in stay: Stay, selectedTime: String, isUpgrade: Bool) {
        var welcomeMessage = "Great! See you at \(selectedTime)"
        if isUpgrade {
            welcomeMessage += " in your upgraded room, Boss!"
        }
        
        if let rvc = rootVC() {
            var vc: UIViewController?
            
            if stay.hotel.isDKeyEnabled {
                print("Stay is DKey enabled, so let's push the Request Key VC")
                vc = dKeyModule.launchRequestKey(for: segment, in: stay, honorsId: member.honorsId, welcomeMessage: welcomeMessage)
                
            } else {
                print("Stay is NOT DKey enabled, so show the check in complete message")
                vc = MessageViewController.messageController(message: welcomeMessage)
            }
            if let vc = vc {
                rvc.present(vc, animated: true)
            }
        }
    }
    
    public func checkInCancelled() {
        print("Sorry you didn't check in, idiot.")
    }
    
    public func creditCardSelectionViewController(with selectedCard: CreditCard, ctyhocn: String, cardSelectedClosure: (CreditCard) -> Void) -> UIViewController {
        
        return UIViewController()
    }
    
    public func webViewController(urlString: String) -> UIViewController {
        return UIViewController()
    }
    
    public func remoteMessageViewController(message: String) -> UIViewController {
        return UIViewController()
    }
    
    func beginUserFlow(flowName: String) {
        
    }
    
    func endUserFlow(flowName: String, reason: UserFlowEndReason) {
        
    }

}


// MARK: DKeyDelegate

extension AppDelegate: DKeyDelegate {
    
    public func travelDocsViewController(honorsId: String, stayId: String, ctyhocn: String, completion: (UIViewController?) ->  Void) {
        dKeyWithOnlyTravelDocsModule.initialTravelDocsViewController(honorsId: honorsId, stayId: stayId, ctyhocn: ctyhocn) { viewController in
            completion(viewController)
        }
    }
    
    public func requestKeyCompleted(stay: Stay) {
        if let rvc = rootVC() {
            let message = "Hells yeah, we'll get that key for your stay at \(stay.hotel.name), bro!"
            let messageVC = MessageViewController.messageController(message: message)
            rvc.present(messageVC, animated: true)
        }
    }
    
    public func requestKeyCancelled() {
        print("Why can't you just request a digital key, for God's sake? I just...")
    }
}


// MARK: DKeyTravelDocsDelegate

extension AppDelegate: DKeyTravelDocsDelegate {
    public func travelDocsCompleted() {
        dKeyModule.readyToSubmitRequestKey()
    }

    public func travelDocsCancelled() {
        dKeyModule.readyToOptInForRequestKey()
    }
}


// MARK: DKeyTravelDocsAPIDelegate

extension AppDelegate: DKeyTravelDocsAPIDelegate {
    public func retrieveTravelDocsForGuest(honorsId: String, completion: APIClientResponseClosure) {
        let response = apiClient.getTravelDocForGuest(honorsId: honorsId)
        completion(response, nil)
    }
    
    public func getTravelDocsForHotel(ctyhocn: String, completion: (JSONDictionaryType?, APIClientError?) -> Void) {
        let response = apiClient.getTravelDocForms(ctyhocn: ctyhocn)
        completion(response, nil)
    }
    
    public func retrieveTravelDocsForGuest(honorsId: String, stayId: String, completion: APIClientResponseClosure) {
        let response = apiClient.getTravelDocForGuest(honorsId: honorsId, stayId: stayId)
        completion(response, nil)
    }
    
    func createTravelDocsForGuest(honorsId: String, stayId: String, travelDocs: [String: Any], completion: APIClientResponseClosure) {
        let response = apiClient.postTravelDocsForGuest(honorsId: honorsId, stayId: stayId, travelDocs: travelDocs)
        completion(response, nil)
    }
    
    func modifyTravelDocsForGuest(honorsId: String, stayId: String, travelDocs: [String: Any], completion: APIClientResponseClosure) {
        let response = apiClient.putTravelDocsForGuest(honorsId: honorsId, stayId: stayId, travelDocs: travelDocs)
        completion(response, nil)
    }
    
    func createTravelDocsForPrimaryGuest(honorsId: String, travelDocs: [String: Any], completion: APIClientResponseClosure) {
        let response = apiClient.postTravelDocsForPrimaryGuest(honorsId: honorsId, travelDocs: travelDocs)
        completion(response, nil)
    }
    
    func modifyTravelDocsForPrimaryGuest(honorsId: String, travelDocs: [String: Any], completion: APIClientResponseClosure) {
        let response = apiClient.putTravelDocsForPrimaryGuest(honorsId: honorsId, travelDocs: travelDocs)
        completion(response, nil)
    }
}


// MARK: StaysDelegate

extension AppDelegate: StaysDelegate {
    
    public func launchCheckIn(for segment: SegmentDetails, in stay: Stay) {
        if let rvc = rootVC() {
            
            checkInModule.launchCheckIn(for: segment, in: stay) { checkInViewController in
                guard let checkInViewController = checkInViewController else { return }
                rvc.present(checkInViewController, animated: true) {
                    print("Presented Check In flow")
                }
            }
        }
    }

    public func launchRequestKey(for segment: SegmentDetails, in stay: Stay, welcomeMessage: String?) {
        if let dKeyModule = dKeyModule,
            let rvc = rootVC() {
            
            let requestKeyVC = dKeyModule.launchRequestKey(for: segment, in: stay, honorsId: member.honorsId, welcomeMessage: welcomeMessage)
            
            rvc.present(requestKeyVC, animated: true) {
                print("Presented Request Key flow")
            }
        }
    }
}

