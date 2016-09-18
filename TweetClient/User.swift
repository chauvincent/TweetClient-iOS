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
    private var _location: String!
    
    var username: String!
    {
        return _username
    }
    
    var imgURL: String!
    {
        return _imgURL
    }
    
    var location: String!
    {
        return _location
    }
    
    init(username: String, url: String, location: String)
    {
        self._username = username
        self._imgURL = url
        self._location = location
    }
    
    
}
