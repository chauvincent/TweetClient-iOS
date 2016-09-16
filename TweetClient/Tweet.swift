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
    
    var text: String {
        return self._text
    }
    
    var uid: String {
        return self._uid
    }
    
    init(text: String, uid: String)
    {
        self._text = text
        self._uid = uid
    }

}
