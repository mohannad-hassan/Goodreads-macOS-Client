//
//  LoginPresentorTests.swift
//  Goodreads macOS Client
//
//  Created by Mohannad Hassan on 12/24/16.
//  Copyright © 2016 Mohannad Hassan. All rights reserved.
//

import XCTest
@testable import Goodreads_macOS_Client

class LoginPresentorTests: XCTestCase {
    
    var loginPresentor: LoginPresentor!

    override func setUp() {
        super.setUp()
        loginPresentor = LoginPresentor(interactor: LoginInteractor(),
                                        view: LoginViewController(nibName: "LoginView", bundle: nil)!)
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
