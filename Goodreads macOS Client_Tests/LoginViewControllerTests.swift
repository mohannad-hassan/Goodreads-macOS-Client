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
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

private class LoginModuleInterfaceMock: LoginModuleInterface {
 
    func authenticate(callback: (AuthenticationFeedback) -> Void) {
        
    }
}
