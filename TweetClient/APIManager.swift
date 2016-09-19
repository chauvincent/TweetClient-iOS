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
    var currentAccount: ACAccount?
 
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

            let allAccounts = store.accounts(with: accountType)
            self.currentAccount = allAccounts?.last as? ACAccount
            
            if (self.currentAccount != nil)
            {
                self.validateAccount(account: self.currentAccount!, completionHandler: { (complete) in
                    let success = (complete) ? true : false
                    completionHandler(success)
                })
            }
            else
            {
                completionHandler(false)
            }
        }
    }
    
    /*  Validate User Auth with Twitter API  */
    func validateAccount(account: ACAccount, completionHandler: @escaping (_ success: Bool) -> Void)
    {
        let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: .GET, url: NSURL(string: "https://api.twitter.com/1.1/account/verify_credentials.json") as URL!, parameters: nil)
        request?.account = self.currentAccount
        request?.perform(handler: { (data, response, error) in
            
            if (error != nil)
            {
                print(error)
                completionHandler(false)
            }

            if let statusCode = response?.statusCode
            {
                let valid = ((statusCode >= 200) && (statusCode < 300)) ? true : false
                completionHandler(valid)
            }
        })
    }
    
    /*  Twitter GET request   */
    func GETUserTimeline(completionHandler: @escaping (_ success: Bool, _ allTweets: [Tweet]?) -> Void)
    {
        let resourceURL = NSURL(string:"https://api.twitter.com/1.1/statuses/home_timeline.json")
        let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: .GET, url: resourceURL as URL!, parameters: nil)
        request?.account = self.currentAccount
        request?.perform(handler: { (data, response, error) in
            
            if (error != nil)
            {
                print(error)
                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(false, nil)
                })
            }
            
            if let statusCode = response?.statusCode
            {
                let valid = ((statusCode >= 200) && (statusCode < 300)) ? true : false
                
                if (valid)
                {
                    JSONParserUtil.parseJSON(data: data!, completionHandler: { (success, tweets) in
                        DispatchQueue.main.async(execute: { () -> Void in
                            completionHandler(success, tweets)
                        })
                    })
                }
                else
                {
                    DispatchQueue.main.async(execute: { () -> Void in
                        completionHandler(false, nil)
                    })
                }
            }
        })
    }
    
    /*  Download Image   */
    func downloadImage(_ imgUrl: String, completionHandler: @escaping (_ tweetImage: UIImage) -> Void )
    {
        OperationQueue().addOperation {
            guard let url = URL(string: imgUrl) else { return }
            guard let imgData = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: imgData) else { return }
            OperationQueue.main.addOperation({
                completionHandler(image)
            })
        }
    }
    
    
    
}
