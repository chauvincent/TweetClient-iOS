//
//  HomeViewController.swift
//  TweetClient
//
//  Created by Vincent Chau on 9/13/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{

    var allTweets: [Tweet]? {
        didSet {
            // Reload table view data
            print("did set tweets")
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        updateWithTestJSON()
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func updateWithTestJSON()
    {
        let testData = JSONParserUtil.loadTestJSON()
        JSONParserUtil.parseJSON(data: testData!)
    }
    
    
}
