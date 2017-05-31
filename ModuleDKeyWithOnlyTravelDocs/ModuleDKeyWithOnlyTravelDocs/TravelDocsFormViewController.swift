//
//  TravelDocsFormViewController.swift
//  ModuleDKeyWithOnlyTravelDocs
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import UIKit
import CoreLibrary

class TravelDocsFormViewController: UIViewController {
    
    var travelDocsForm: TravelDocsForm!
    var guestId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }    


}

// This is just for convenience in this demo app
extension UIViewController {
    @IBAction func dismiss() {
        print("Guest info submitted")
        dismiss(animated: true)
    }
}

