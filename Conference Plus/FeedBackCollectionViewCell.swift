//
//  FeedBackCollectionViewCell.swift
//  TechFest
//
//  Created by Suneet Tipirneni on 9/22/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class FeedBackCollectionViewCell: UICollectionViewCell {
    
    var title:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Autolayout for the title.
        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "HELLO"
        self.addSubview(title)
        
        title.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        title.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
