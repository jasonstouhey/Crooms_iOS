//
//  ItemCollectionViewCell.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/15/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Class Variables.
    
    var titleLabel:UILabel!
    var squishAnimation:UIViewPropertyAnimator!
    var colorAnimation:UIViewPropertyAnimator!
    var headerImage:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup cell
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.backgroundColor = UIColor.white
        
        // Setup Label.
        self.translatesAutoresizingMaskIntoConstraints = false
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .natural
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        self.addSubview(titleLabel)
       
        
        // Autolayout.
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true

        // Setup Image.
        headerImage = UIImageView()
        self.addSubview(headerImage)
        
        // Autolayout
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        headerImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        headerImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        headerImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
        // Properties
        headerImage.image = #imageLiteral(resourceName: "Tech Image")
        headerImage.clipsToBounds = true
        headerImage.contentMode = UIViewContentMode.scaleAspectFill
        headerImage.setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        
        
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

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event)
    }
    
}
