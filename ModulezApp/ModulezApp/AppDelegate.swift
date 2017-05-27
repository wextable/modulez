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
import ModuleStays

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var checkInModule: CheckInModule!
    var dKeyModule: DKeyModule!
    var staysModule: StaysModule!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupModules()        
        stubInitialVC()
        
        return true
    }

    func setupModules() {
        setupCheckInModule()
        setupDKeyModule()
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
        let hotel = Hotel(ctyhocn: "DCAOTHF", name: "Hilton Alexandria", isDKeyEnabled: false)
        let stay = Stay(confirmationNumber: "12345678", hotel: hotel)
        let stayCardVC = staysModule.launchStayCard(for: stay)
        if let w = window {
            w.rootViewController = stayCardVC
        }
    }
}


extension AppDelegate: CheckInDelegate {
    
    public func checkInCompleted(stay: Stay, selectedTime: String, isUpgrade: Bool) {
        var welcomeMessage = "Great! See you at \(selectedTime)"
        if isUpgrade {
            welcomeMessage += " in your upgraded room, Boss!"
        }
        
        if let rvc = rootVC() {
            var vc: UIViewController?
            
            if stay.hotel.isDKeyEnabled {
                vc = dKeyModule.launchRequestKey(for: stay, welcomeMessage: welcomeMessage)
                
            } else {
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

extension AppDelegate: DKeyDelegate {
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

extension AppDelegate: StaysDelegate {
    public func launchCheckIn(for stay: Stay) {
        if let rvc = rootVC(){//,
            let checkInStay = stay as! Stay// {
            
            let checkInVC = checkInModule.launchCheckIn(for: checkInStay)
            rvc.present(checkInVC, animated: true) {
                print("Presented Check In flow")
            }
        }
    }

    public func launchRequestKey(for stay: Stay, welcomeMessage: String?) {
        if let dKeyModule = dKeyModule,
            let rvc = rootVC() {
            
            let requestKeyVC = dKeyModule.launchRequestKey(for: stay, welcomeMessage: welcomeMessage)
            
            rvc.present(requestKeyVC, animated: true) {
                print("Presented Request Key flow")
            }
        }
    }
}

