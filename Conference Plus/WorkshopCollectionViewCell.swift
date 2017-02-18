//
//  WorkshopCollectionViewCell.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/17/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class WorkshopCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Class Variables
    
    var titleLabel:UILabel!
    var subtitleLabel:UILabel!
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup Cell.
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        // Setup Label.
        titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "WORKSHOP"
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 3
        
        // Label Autolayout.
        titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
