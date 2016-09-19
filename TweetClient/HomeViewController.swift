//
//  HomeViewController.swift
//  TweetClient
//
//  Created by Vincent Chau on 9/13/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit
import Accounts
import Social

class HomeViewController: UIViewController
{
    
    @IBOutlet weak var feedTableView: UITableView!
    
    static var imageCache = NSCache<NSString, UIImage>()
    
    var allTweets: [Tweet]? {
        didSet {
            self.feedTableView.reloadData()
            print("did set tweets")
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupView()
        self.setupUser()
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
    
    func setupUser()
    {
        APIManager.sharedInstance.loginFromSocial { (success) in
            if (success)
            {
                APIManager.sharedInstance.GETUserTimeline(completionHandler: { (success, tweets) in
                    if (success)
                    {
                        self.allTweets = tweets
                    }
                })
            }
            else
            {
                let alertController = UIAlertController(title: "Error", message: "Please add a twitter account in your settings tab", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "dismiss", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                self.present(alertController, animated: false, completion: nil)
            }
        }
    }
    func loadTestingJSON()
    {
        let testData = JSONParserUtil.loadTestJSON()
        JSONParserUtil.parseJSON(data: testData!) { (success, tweets) in
            print(success)
        }
    }

}

private typealias TableViewDataSource = HomeViewController
extension TableViewDataSource: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        guard let count = allTweets?.count
            else { return 0 }
        return count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: TweetTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetTableViewCell
        cell.currentTweet = self.allTweets?[indexPath.row]
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
