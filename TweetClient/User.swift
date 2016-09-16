//
//  User.swift
//  TweetClient
//
//  Created by Vincent Chau on 9/15/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

class User
{
    private var _username: String!
    private var _imgURL: String!
    
    var username : String!
    {
        return _username
    }
    
    var imgURL : String!
    {
        return _imgURL
    }
    
    init(username: String, url: String)
    {
        self._username = username
        self._imgURL = imgURL
    }
    
    
}
