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

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userTextLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userLocationLabel: UILabel!
    
    var currentTweet: Tweet! {
        didSet {
            self.userTextLabel.text = self.currentTweet.text
            self.usernameLabel.text = self.currentTweet.user.username
            self.userLocationLabel.text = self.currentTweet.user.location
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
