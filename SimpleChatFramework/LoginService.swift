//
//  LoginService.swift
//  SimpleChatFramework
//
//  Created by Anurag Agnihotri on 12/10/15.
//  Copyright © 2015 Anurag Agnihotri. All rights reserved.
//

import Foundation
import Alamofire
import Quickblox

public class LoginService {
    
    public func loginToChat(userId: String, password: String, callback: (success: Bool, errorMessage: String?, user: QBUUser?) -> Void) {
        QBRequest.logInWithUserLogin(userId, password: password, successBlock: {(response, user) in
            if let user = user {
                QBChat.instance().connectWithUser(user)
                callback(success: true, errorMessage: nil, user: user)
            }}, errorBlock: {(error) in
                callback(success: false, errorMessage: error.debugDescription, user: nil)
        })
    }
}