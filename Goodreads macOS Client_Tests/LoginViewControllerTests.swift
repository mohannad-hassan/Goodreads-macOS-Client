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
    
    let semaphore = DispatchSemaphore(value: 0)

    override func setUp() {
        super.setUp()
        moduleInterfaceMock = LoginModuleInterfaceMock(tests: self, semaphore: semaphore)
        
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
    
    func testPressingButton() {
        loginViewController.displayLoginButton()
        
        let button: NSButton = loginViewController.view.viewWithTag(1) as! NSButton
        assert(button.isEnabled, "Button is not enabled")
        
        button.performClick(button)
        
        let timeoutResult = semaphore.wait(timeout: .now() + 0.1)
        
        XCTAssert(timeoutResult == .success, "LoginModuleInterface.authenticate was not called")
    }
    
    func viewControllerDidCallAuthentication() -> AuthenticationFeedback {
        semaphore.signal()
        return .Success
    }
}

private class LoginModuleInterfaceMock: LoginModuleInterface {
    
    let tests: LoginViewControllerTests
    let semaphore: DispatchSemaphore
    
    init(tests: LoginViewControllerTests, semaphore: DispatchSemaphore) {
        self.tests = tests
        self.semaphore = semaphore
    }
 
    func authenticate(callback: (AuthenticationFeedback) -> Void) {
        callback(tests.viewControllerDidCallAuthentication())
    }
}
