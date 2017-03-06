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
    var headerImageView:UIImageView!
    var squishAnimation:UIViewPropertyAnimator!
    var descriptionTextView:UITextView!
    var showMoreButton:UIButton!
    var isExpanded:Bool = false
    var delegate:WorkshopsViewController?
    var indexPath:IndexPath!
    var imageTopAnchor:NSLayoutConstraint!
    var fileParser: JKJSONFile? = JKJSONFile.init(fileName: "workshops.json")
    var presenterLabel: UILabel!
    var timeLabel: UILabel!
    var gradeLabel: UILabel!

    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Setup Cell.
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        // Setup Label.
        titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "WORKSHOP"
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFontWeightHeavy)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 3
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .natural
        
        // Label Autolayout.
        titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        
        
        // Setup Label.
        presenterLabel = UILabel()
        self.addSubview( presenterLabel)
        presenterLabel.translatesAutoresizingMaskIntoConstraints = false
         presenterLabel.text = "WORKSHOP"
         presenterLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFontWeightThin)
         presenterLabel.adjustsFontSizeToFitWidth = true
         presenterLabel.textAlignment = .center
         presenterLabel.numberOfLines = 3
         presenterLabel.textColor = UIColor.white
         presenterLabel.textAlignment = .natural
        
        
        presenterLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        presenterLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        presenterLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        presenterLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.4).isActive = true
 
        
        // Setup Label.
        timeLabel = UILabel()
        self.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.text = "WORKSHOP"
        timeLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFontWeightThin)
        timeLabel.adjustsFontSizeToFitWidth = true
        timeLabel.textAlignment = .center
        timeLabel.numberOfLines = 3
        timeLabel.textColor = UIColor.white
        timeLabel.textAlignment = .natural
        
        
        timeLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.6).isActive = true
        
        
        // Setup Label.
        gradeLabel = UILabel()
        self.addSubview(gradeLabel)
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        gradeLabel.text = "WORKSHOP"
        gradeLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFontWeightThin)
        gradeLabel.adjustsFontSizeToFitWidth = true
        gradeLabel.textAlignment = .center
        gradeLabel.numberOfLines = 3
        gradeLabel.textColor = UIColor.white
        gradeLabel.textAlignment = .natural
        
        
        gradeLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        gradeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        gradeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        gradeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.8).isActive = true

        
        // Cell Autolayout.
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
    
    func showMore(){
        
        print("Button Hit")
        
       
       
                self.setNeedsLayout()
        self.setNeedsDisplay()
print(self.frame)
        
        if self.isExpanded == false{
             self.frame.size = CGSize(width: self.frame.width, height: 250)
            imageTopAnchor.isActive = false
            imageTopAnchor = headerImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width * 0.15)
            imageTopAnchor.isActive = true
            self.isExpanded = true
        }else if self.isExpanded == true{
            self.frame.size = CGSize(width: self.frame.width, height: 100)
            imageTopAnchor.isActive = false
            imageTopAnchor = headerImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width * 0.05)
            self.isExpanded = false
        }
        
        delegate?.cellSizeChanged(indexPath:indexPath)
        self.setNeedsLayout()
        self.setNeedsDisplay()
        
        
                
        
        
        
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

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event)
    }
    
}
