//
//  TweetTableViewCell.swift
//  TweetClient
//
//  Created by Vincent Chau on 9/17/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var userImageView: CircleImageView!
    @IBOutlet weak var userTextLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userLocationLabel: UILabel!
    
    var currentTweet: Tweet!
    {
        didSet {
            self.userTextLabel.text = self.currentTweet.text
            self.usernameLabel.text = self.currentTweet.user.username
            self.userLocationLabel.text = self.currentTweet.user.location
            

            if let imgURL = self.currentTweet.user.imgURL
            {
                let url: NSString = (imgURL as NSString)
                if let image = HomeViewController.imageCache.object(forKey: url)
                {
                    print("in cache")
                    self.userImageView.image = image
                }
                else
                {
                    print("not in chace")
                    APIManager.sharedInstance.downloadImage(imgURL, completionHandler: { (image) in
                        self.userImageView.image = image
                        HomeViewController.imageCache.setObject(image, forKey: url)
                    })
                }
            }
            else
            {
                print("bad image url")
            }
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
    }
    
    
}
