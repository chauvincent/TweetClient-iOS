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
    @IBOutlet weak var feedTableView: UITableView!
    var allTweets: [Tweet]? {
        didSet {
            // Reload table view data
            print("did set tweets")
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
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
    func setupView()
    {
        self.navigationItem.title = "Home"
    }
    
    
    func updateWithTestJSON()
    {
        let testData = JSONParserUtil.loadTestJSON()
        JSONParserUtil.parseJSON(data: testData!) { (success, tweets) in
            
        }
    }
    
    
}
