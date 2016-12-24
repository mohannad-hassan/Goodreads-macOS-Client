//
//  LoginViewControllerTests.swift
//  Goodreads macOS Client
//
//  Created by Mohannad Hassan on 12/24/16.
//  Copyright © 2016 Mohannad Hassan. All rights reserved.
//

import XCTest
@testable import Goodreads_macOS_Client

class LoginViewControllerTests: XCTestCase {
    
    var loginViewController: LoginViewController!
    var moduleInterfaceMock: LoginModuleInterface!

    override func setUp() {
        super.setUp()
        moduleInterfaceMock = LoginModuleInterfaceMock()
        
        loginViewController = LoginViewController(nibName: "LoginView", bundle: nil)
        loginViewController.moduleInterface = moduleInterfaceMock
        loginViewController.loadView()
    }
    
    func testDisplayButton() {
        loginViewController.displayLoginButton()
        let button: NSButton = loginViewController.view.viewWithTag(1) as! NSButton
        assert(button.isEnabled, "Button is not enabled")
    }

    func testButtonDisabledAfterLoading() {
        let button: NSButton = loginViewController.view.viewWithTag(1) as! NSButton
        assert(!button.isEnabled, "Button is enabled")
    }
}

private class LoginModuleInterfaceMock: LoginModuleInterface {
 
    func authenticate(callback: (AuthenticationFeedback) -> Void) {
        
    }
}
