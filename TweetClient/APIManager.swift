//
//  APIManager.swift
//  TweetClient
//
//  Created by Vincent Chau on 9/15/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation
import Accounts
import Social

class APIManager
{
    static let sharedInstance = APIManager()
    var loggedUser: ACAccount?
    
    
    
    
    /*  Login to twitter from Social Framework  */
    func loginFromSocial(completionHandler: @escaping (_ success: Bool) -> Void)
    {
        let store = ACAccountStore()
        let accountType = store.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        store.requestAccessToAccounts(with: accountType, options: nil) { (success, error) in
           
            if (error != nil)
            {
                print(error?.localizedDescription)
                completionHandler(false)
            }
            else
            {
                let allAccounts = store.accounts(with: accountType)
                self.loggedUser = allAccounts?.last as? ACAccount
                
                completionHandler(true)
            }
        }
    }
    
    func validateAccount(account: ACAccount, completionHandler: @escaping (_ success: Bool) -> Void)
    {
        
    }
    
}
