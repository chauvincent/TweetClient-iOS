//
//  Tweet.swift
//  TweetClient
//
//  Created by Vincent Chau on 9/15/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

class Tweet
{
    private var _text: String!
    private var _uid: String!
    private var _user: User!
    
    var text: String
    {
        return self._text
    }
    
    var uid: String
    {
        return self._uid
    }
    
    var user: User
    {
        return _user
    }
    
    init(text: String, uid: String, user: User)
    {
        self._text = text
        self._uid = uid
        self._user = user
    }
}
