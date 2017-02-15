//
//  ItemCollectionViewCell.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/15/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    var titleLabel:UILabel!
    var squishAnimation:UIViewPropertyAnimator!
    var colorAnimation:UIViewPropertyAnimator!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup cell
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 5
        self.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        // Setup Label.
        self.translatesAutoresizingMaskIntoConstraints = false
        titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.text = "Test"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        
        
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        
        squishAnimation = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 30, animations: {
            let scale = self.transform.scaledBy(x: 0.5, y: 0.5)
            
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
