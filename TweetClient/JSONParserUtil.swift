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
    enum ParserError: Error
    {
        case invalidUID
        case invalidText
        case invalidUsername
        case invalidUserImgURL
        case invalidUserLocation
    }
    
    /*  Parse JSON from an NSData object */
    class func parseJSON(data: NSData, completionHandler: @escaping (_ success: Bool, _ allTweets:[Tweet]?) -> Void)
    {
        var tweets: [Tweet] = []
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data as Data, options: []) as? [[String: AnyObject]]
            
            for tweetDict in jsonData!
            {
                tweets.append(try parseTweet(tweetDict: tweetDict)!)
            }
            
            completionHandler(true, tweets)
            
        } catch {
            print("error serializing JSON: \(error)")
        }
        
        completionHandler(false, nil)
    }

    /*  Load Test JSON Data to parse  */
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
    
        return (jsonData != nil) ? jsonData : nil
    }
    
    class func parseTweet(tweetDict: [String : AnyObject]) throws -> Tweet?
    {
        guard let uid = tweetDict[kTweetUID] as? String
            else {  throw ParserError.invalidUID }
        
        guard let text = tweetDict[kTweetText] as? String
            else {  throw ParserError.invalidText }
        
        guard let userName = tweetDict[kTweetUser]?[kTweetUserName] as? String
            else { throw ParserError.invalidUsername }
        
        guard let imgUrl = tweetDict[kTweetUser]?[kTweetUserImageURL] as? String
            else { throw ParserError.invalidUserLocation }
        
        guard let location = tweetDict[kTweetUser]?[kTweetUserLocation] as? String
            else { throw ParserError.invalidUserLocation }
        
        let userInfo = User(username: userName, url: imgUrl, location: location)
        
        return Tweet(text: text, uid: uid, user: userInfo)
    }
}
