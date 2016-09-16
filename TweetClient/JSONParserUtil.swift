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
