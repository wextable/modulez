//
//  MessageViewController.swift
//  CoreLibrary
//
//  Created by Wesley St. John on 5/24/17.
//  Copyright © 2017 mobileforming. All rights reserved.
//

import UIKit

public class MessageViewController: UIViewController {

    private var message = ""
    @IBOutlet private var label: UILabel!
    
    public static func messageController(message: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "CoreLibrary", bundle: Bundle(for: self))
        let vc = storyboard.instantiateViewController(withIdentifier :"MessageViewController") as! MessageViewController
        vc.message = message
        return vc
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        label.text = message
    }

    @IBAction func dismiss() {
        dismiss(animated: true)
    }

}
