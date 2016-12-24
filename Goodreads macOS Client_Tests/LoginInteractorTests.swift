//
//  LoginInteractorTests.swift
//  Goodreads macOS Client
//
//  Created by Mohannad Hassan on 12/24/16.
//  Copyright © 2016 Mohannad Hassan. All rights reserved.
//

import XCTest
@testable import Goodreads_macOS_Client

class LoginInteractorTests: XCTestCase {
    
    var interactor: LoginInteractor!

    override func setUp() {
        super.setUp()
        
        interactor = LoginInteractor(authenticationCenter: AuthenticationCenterMock())
    }
    
    func testAuthenticate() {
        var called = false
        interactor.authenticate() { authenticationFeedback in
            called = true
        }
        let callbackExpectation = expectation(description: "Callback from LoginInteractor.authenticate()")
        
        callbackExpectation.fulfill()
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Got error: \(error)")
        }
        
        XCTAssert(called, "Callback from LoginInteractor.authenticate() never called")
    }

}

class AuthenticationCenterMock: AuthenticationCenter {
    
    override func authenticate(callback: (AuthenticationFeedback) -> Void) {
        callback(.Success)
    }
}
