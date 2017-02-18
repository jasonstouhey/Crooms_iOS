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
    var squishAnimation:UIViewPropertyAnimator!
    
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
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        
        squishAnimation = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 30, animations: {
            let scale = self.transform.scaledBy(x: 0.8, y: 0.8)
            
            let rotate = self.transform.rotated(by: 0.3)
            self.transform.concatenating(rotate)
            self.transform = scale
            
        })
        squishAnimation.isReversed = true
        squishAnimation.startAnimation()
        
        
        self.next?.touchesBegan(touches, with: event)
        
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        
        squishAnimation = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 30, animations: {
            self.transform = CGAffineTransform.identity
        })
        
        squishAnimation.stopAnimation(true)
        
        squishAnimation.startAnimation()
        
        
        self.next?.touchesEnded(touches, with: event)
        
    }

    
}
