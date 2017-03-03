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

    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Setup Cell.
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = #colorLiteral(red: 0.5904989243, green: 0.02005090751, blue: 0.1395291388, alpha: 1)
        
        // Setup Label.
        titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "WORKSHOP"
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFontWeightThin)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 3
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .natural
        
        // Label Autolayout.
        titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
        // Setup Image View.
        headerImageView = UIImageView()
        self.addSubview(headerImageView)
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Image View Autolayout.
        headerImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        headerImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        imageTopAnchor = headerImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.2 * self.frame.height)
        imageTopAnchor.isActive = true
        headerImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerImageView.image = #imageLiteral(resourceName: "project-newton-oakhill-interior.jpg")
        headerImageView.clipsToBounds = true
        headerImageView.contentMode = UIViewContentMode.scaleAspectFill
        
        // Setup Text View.
        descriptionTextView = UITextView()
        self.addSubview(descriptionTextView)
        descriptionTextView.isEditable = false
        descriptionTextView.backgroundColor = UIColor.clear
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.textColor = UIColor.white

        
        // Text View Autolayout.
        descriptionTextView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        descriptionTextView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        descriptionTextView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget dignissim lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut orci ligula, auctor sed lorem in, mollis sodales risus. Aenean nec urna eget felis vulputate scelerisque. Curabitur mattis pharetra ex at ullamcorper. Curabitur dignissim ultrices erat nec faucibus. Nulla facilisi. Nullam ullamcorper bibendum enim, non placerat dolor dictum id. Aliquam consectetur maximus malesuada. In luctus ante eu faucibus ultricies.rProin orci velit, vestibulum sit amet metus nec, gravida luctus purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse gravida consequat dignissim. Duis fermentum gravida maximus. Sed condimentum cursus turpis ac finibus. Sed a magna ullamcorper, condimentum mauris eget, tempus tortor. Morbi pellentesque vel mauris quis ultrices."
        
        // Setup button
        showMoreButton = UIButton()
        showMoreButton.translatesAutoresizingMaskIntoConstraints = false
        showMoreButton.addTarget(self, action: #selector(WorkshopCollectionViewCell.showMore), for: .touchUpInside)
        showMoreButton.setTitleColor(UIColor.white, for: .normal)
        showMoreButton.setTitle("Buttom", for: .normal)
        
        self.addSubview(showMoreButton)
        
        // Button Autolayout.
        showMoreButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        showMoreButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        showMoreButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        showMoreButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
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
