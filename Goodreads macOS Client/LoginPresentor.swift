//
//  LoginPresentor.swift
//  Goodreads macOS Client
//
//  Created by Mohannad Hassan on 12/24/16.
//  Copyright © 2016 Mohannad Hassan. All rights reserved.
//

import Cocoa

class LoginPresentor: LoginModuleInterface {
    
    let interactor: LoginInteractor
    let view: LoginViewInterface
    
    public init(interactor: LoginInteractor, view: LoginViewInterface) {
        self.interactor = interactor
        self.view = view
    }

    func authenticate(callback: (AuthenticationFeedback) -> Void) {
        
    }
}
