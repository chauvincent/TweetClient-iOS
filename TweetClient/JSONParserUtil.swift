//
//  JSONParserUtil.swift
//  TweetClient
//
//  Created by Vincent Chau on 9/15/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class JSONParserUtil
{
    /*  Parser Error Types */
    enum ParserError: Error {
        case invalidUID
        case invalidText
    }
    
    /*  Parse JSON from an NSData object */
    class func parseJSON(data: NSData) -> [Tweet]?
    {
        var tweets: [Tweet] = []
        do {

            let jsonData = try JSONSerialization.jsonObject(with: data as Data, options: []) as? [[String: AnyObject]]
            
            for tweetDict in jsonData! {
                
                guard let uid = tweetDict["user"]?["name"] as? String
                    else {  throw ParserError.invalidUID }

                guard let text = tweetDict["text"] as? String
                    else {  throw ParserError.invalidText }
                
                print(uid)
                print(text)
            
                let tweet = Tweet(text: text, uid: uid)
                tweets.append(tweet)
            }
            
            return tweets;

        } catch {
            print("error serializing JSON: \(error)")
        }
        
        
        return nil
    }

    /*  Load Test JSON Data to parse */
    class func loadTestJSON() -> NSData?
    {
        var jsonData: NSData?
        if let path = Bundle.main.path(forResource: "testing", ofType: "json")
        {
            do {
                let data = try NSData(contentsOfFile: path, options: .mappedIfSafe)
                jsonData = data
            
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        if jsonData != nil
        {
            return jsonData!
        }
        
        return nil
    }
}
