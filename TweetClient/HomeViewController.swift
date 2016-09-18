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
        self.feedTableView.delegate = self
        self.feedTableView.dataSource = self
    }
    
    
    func updateWithTestJSON()
    {
        let testData = JSONParserUtil.loadTestJSON()
        JSONParserUtil.parseJSON(data: testData!) { (success, tweets) in
            
        }
    }

}

private typealias TableViewDataSource = HomeViewController
extension TableViewDataSource: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath)
        return cell
    }

}

private typealias TableViewDelegate = HomeViewController
extension TableViewDelegate: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    

}
