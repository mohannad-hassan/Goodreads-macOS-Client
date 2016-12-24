//
//  LoginViewController.swift
//  Goodreads macOS Client
//
//  Created by Mohannad Hassan on 12/24/16.
//  Copyright © 2016 Mohannad Hassan. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController, LoginViewInterface {

    @IBOutlet weak var loginButton: NSButton!
    var moduleInterface: LoginModuleInterface?
    
    public func displayLoginButton() {
        loginButton.isEnabled = true
    }
    
    @IBAction func login(_ sender: NSButton) {
        moduleInterface?.authenticate() {authenticationFeedback in
            print(authenticationFeedback)
        }
    }
    
}
