//
//  LoginModuleInterfaces.swift
//  Goodreads macOS Client
//
//  Created by Mohannad Hassan on 12/24/16.
//  Copyright © 2016 Mohannad Hassan. All rights reserved.
//

import Foundation

enum AuthenticationFeedback {
    case Success
    case Failure(message: String)
}

protocol LoginModuleInterface {
    
    func authenticate(callback: (AuthenticationFeedback) -> Void)
}

protocol LoginViewInterface {
    
    func displayLoginButton()
}

