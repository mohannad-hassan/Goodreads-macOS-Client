//
//  LoginInteractor.swift
//  Goodreads macOS Client
//
//  Created by Mohannad Hassan on 12/24/16.
//  Copyright © 2016 Mohannad Hassan. All rights reserved.
//

import Cocoa

class LoginInteractor: NSObject {
    
    let authenticationCenter: AuthenticationCenter
    
    init(authenticationCenter: AuthenticationCenter) {
        self.authenticationCenter = authenticationCenter
    }
    
    public func authenticate(callback: (AuthenticationFeedback) -> Void) {
        authenticationCenter.authenticate(callback: callback)
    }

}
