//
//  ViewController.swift
//  AutolayoutTest
//
//  Created by Victor Hazali on 28/10/15.
//  Copyright © 2015 Victor Hazali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    var secure = false {
        didSet{
            updateUI()
        }
    }
    
    @IBAction func securityToggle() {
        secure = !secure
    }
    
    @IBAction func login() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI(){
        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "Secure Password" : "Password"
        
    }
    
}

