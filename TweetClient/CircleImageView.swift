//
//  CircleImageView.swift
//  TweetClient
//
//  Created by Vincent Chau on 9/18/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView
{
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.size.width / 2.0
        self.layer.borderWidth = 0.1
        self.layer.borderColor = UIColor.black.cgColor
    }
}
