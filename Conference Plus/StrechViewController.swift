//
//  ViewController.swift
//  Strech
//
//  Created by Suneet Tipirneni on 10/16/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

open class STStrechViewController: UIViewController ,UITextViewDelegate, UIScrollViewDelegate {
    
    // MARK: - Class Variables
    
    /// The view of the header which includes the title.
    public var headerView:UIView!
    var headerViewHeightAnchor:NSLayoutConstraint!
    var assignedContentInset:CGFloat!
    var leftBarButtonItem:UIBarButtonItem!
    var rightBarButtonItem:UIBarButtonItem!
    var navigationToolbar:UIToolbar!
    var headerLabelBackgroundView:UIView!
    var fadeAnimation:UIViewPropertyAnimator!
    var fadeInAnimation:UIViewPropertyAnimator!
    var scaleAnimation:UIViewPropertyAnimator!
    
    /// The view that will be the main view that scrolls in the view controller, set this to your main `tableView`, `CollectionView`, or any `ScrollView`. This view will scroll in symphony with the top bar on the view controller.
    public var scrollView:UIScrollView!{
        didSet{
            
            
            
            // Decide what type of scrollable view that the content is a part of, and set the appropriate scroll delegate.
            if ((scrollView as? UITableView) != nil){
                scrollView = scrollView as! UITableView
                if (scrollView as! UITableView).delegate != nil{
                    (scrollView as! UITableView).delegate = (self as! UITableViewDelegate)
                }
                reload()
            }else if ((scrollView as? UICollectionView) != nil){
                scrollView = scrollView as! UICollectionView
                if (scrollView as! UICollectionView).delegate != nil{
                    (scrollView as! UICollectionView).delegate = (self as! UICollectionViewDelegate)
                }
                reload()
            }else if (scrollView as? UITextView) != nil{
                scrollView = scrollView as! UITextView
                if (scrollView as! UITextView).delegate != nil{
                    (scrollView as! UITextView).delegate = (self as UITextViewDelegate)
                }
            }else if (scrollView) != nil{
                
                if scrollView.delegate != nil{
                    scrollView.delegate = self
                }
            }
            
        }
    }
    var contentViewHeightAnchor:NSLayoutConstraint!
    public var headerImageView:UIImageView!
    public var maxHeaderHeightMultiplier:CGFloat! = 0.2{
        didSet{
            
            reload()
        }
    }
    var maxContentHeightMuliplier:CGFloat!
    
    /// The title that appears on the headerView.
    public var headerTitleLabel:UILabel!
    
    
    /// The smallest height that header view goes to.
    public var compactHeaderHeight:CGFloat! = 66
    var averageColor = UIColor()
    public var headerImage:UIImage!{
        didSet{
            headerImageView = UIImageView(image: headerImage)
            
        }
    }
    
    var isInitialLoad = true
    
    // MARK: - Lifecycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        maxContentHeightMuliplier = 1.0 - maxHeaderHeightMultiplier
        
        if scrollView == nil{
            scrollView = UIScrollView()
            print("Warning: \(self) does not have an assigned scrollview, if you wish to achieve the strechy effect assign a scroll view such as a tableview, collectionview, scrollview, etc...")
            
        }
        
        // Set the scroll view behavior to not be automatic.
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set the initial inset for the scroll bars.
        scrollView.scrollIndicatorInsets.top = self.view.frame.height * maxHeaderHeightMultiplier
        
        // Create the header view.
        headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.red
        view.addSubview(scrollView)
        view.addSubview(headerView)
        
        // Apply autolayout to the content view.
        contentViewHeightAnchor = scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1)
        contentViewHeightAnchor.isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        // Apple autolayout to the header view.
        headerViewHeightAnchor = headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: maxHeaderHeightMultiplier)
        headerViewHeightAnchor.isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Setup text label for header view.
        headerTitleLabel = UILabel()
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerTitleLabel.adjustsFontSizeToFitWidth = true
        headerTitleLabel.text = "About"
        headerTitleLabel.textColor = UIColor.white
        
        // Nilcheck for headerImage.
        if headerImage != nil{
            
            averageColor = (headerImageView.image?.areaAverageColor())!
            
            headerImageView.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(headerImageView)
            headerImageView.contentMode = .scaleAspectFill
            headerImageView.heightAnchor.constraint(equalTo: headerView.heightAnchor).isActive = true
            headerImageView.widthAnchor.constraint(equalTo: headerView.widthAnchor).isActive = true
            headerImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
            headerImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
            headerImageView.clipsToBounds = true
            print(view.frame.height)
        }else{
            headerImageView = UIImageView()
            headerImageView.backgroundColor = UIColor.darkGray
            headerTitleLabel.textColor = UIColor.white
        }
        
        // Set initial scroll insets
        scrollView.contentInset.top = self.view.frame.height * maxHeaderHeightMultiplier
        scrollView.scrollIndicatorInsets.top = self.view.frame.height * maxHeaderHeightMultiplier
        scrollView.layoutSubviews()
        scrollView.layoutIfNeeded()
        
        // Final draft.
        self.headerTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        headerTitleLabel.textAlignment = .center
        headerView.addSubview(headerTitleLabel)
        headerView.bringSubview(toFront: headerTitleLabel)
        headerTitleLabel.constrainEqual(toView: headerView)
        
        
        if self.title != nil{
            headerTitleLabel.text = self.title!
        }else{
            headerTitleLabel.text = "Title"
        }
        
    }
    
    // Mostly the same as initial load, but eliminates some unneccessary redundancy.
    public func reload(){
        
        maxContentHeightMuliplier = 1.0 - maxHeaderHeightMultiplier
        
        assignedContentInset = self.scrollView.contentInset.top
        
        if self.headerView != nil{
            self.headerView.removeFromSuperview()
        }
        maxContentHeightMuliplier = 1.0 - maxHeaderHeightMultiplier
        if scrollView == nil{
            scrollView = UIScrollView()
        }
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.scrollIndicatorInsets.top = self.view.frame.height * maxHeaderHeightMultiplier
        
        headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.red
        view.addSubview(scrollView)
        view.addSubview(headerView)
        
        
        contentViewHeightAnchor = scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1)
        contentViewHeightAnchor.isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        headerViewHeightAnchor = headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: maxHeaderHeightMultiplier)
        headerViewHeightAnchor.isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        headerTitleLabel = UILabel()
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerTitleLabel.adjustsFontSizeToFitWidth = true
        headerTitleLabel.textColor = UIColor.white
        
        if headerImage != nil{
            headerImageView = UIImageView(image: headerImage)
            headerImageView.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(headerImageView)
            headerImageView.contentMode = .scaleAspectFill
            headerImageView.heightAnchor.constraint(equalTo: headerView.heightAnchor).isActive = true
            headerImageView.widthAnchor.constraint(equalTo: headerView.widthAnchor).isActive = true
            headerImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
            headerImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
            headerImageView.clipsToBounds = true
            print(view.frame.height)
        }else{
            headerImageView = UIImageView()
            headerImageView.backgroundColor = UIColor.darkGray
            headerTitleLabel.textColor = UIColor.white
        }
        
        scrollView.contentInset.top = (self.view.frame.height * maxHeaderHeightMultiplier)
        
        scrollView.scrollIndicatorInsets.top = self.view.frame.height * maxHeaderHeightMultiplier
        scrollView.layoutSubviews()
        scrollView.layoutIfNeeded()
        
        self.headerTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.headerTitleLabel.textColor = UIColor.white
        headerTitleLabel.textAlignment = .center
        headerView.addSubview(headerTitleLabel)
        headerView.bringSubview(toFront: headerTitleLabel)
        headerTitleLabel.constrainEqual(toView: headerView)
        
        if self.title != nil{
            headerTitleLabel.text = self.title!
        }else{
            headerTitleLabel.text = "Workshops"
        }
        let str = headerTitleLabel.text
        
        let size = str?.size(withAttributes: [NSAttributedStringKey.font:headerTitleLabel.font])
        
        headerLabelBackgroundView = UIView()
        headerView.addSubview(headerLabelBackgroundView)
        
        headerLabelBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        headerLabelBackgroundView.widthAnchor.constraint(equalToConstant: size!.width + 20).isActive = true
        headerLabelBackgroundView.heightAnchor.constraint(equalToConstant: size!.height + 10).isActive = true
        headerLabelBackgroundView.centerYAnchor.constraint(equalTo: headerTitleLabel.centerYAnchor).isActive = true
        headerLabelBackgroundView.centerXAnchor.constraint(equalTo: headerTitleLabel.centerXAnchor).isActive = true
        headerLabelBackgroundView.backgroundColor = UIColor.white
        headerLabelBackgroundView.layer.cornerRadius = 6
        
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.headerImageView.addSubview(blurView)
        blurView.constrainEqual(toView: headerImageView)
        blurView.alpha = 0.8
        headerView.bringSubview(toFront: headerTitleLabel)
        headerLabelBackgroundView.alpha = 0
        
        fadeAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: { () -> Void in
            
        })
        
        fadeInAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: { () -> Void in
            
            self.headerLabelBackgroundView.alpha = 1
            
        })
        
        scaleAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: { () -> Void in
            
            self.headerLabelBackgroundView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.headerTitleLabel.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
            
        })
        
        
    }
    
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Check if the scroll is initial or not.
        if isInitialLoad == true{
            isInitialLoad = false
            return
        }
        
        // Calculate the change, and the subsequent header height.
        let headerChange = -scrollView.contentOffset.y - assignedContentInset
        
        if headerChange >= 0{
            // Adjust anchors to reflect change.
            headerViewHeightAnchor.isActive = false
            headerViewHeightAnchor = headerView.heightAnchor.constraint(equalToConstant: headerChange)
            headerViewHeightAnchor.isActive = true
            
            
        }
        
        // Adjust scroll insets to show change.
        scrollView.scrollIndicatorInsets.top = headerChange
        
        // If the header view if as the compact size, stop decreasing it's height.
        if headerViewHeightAnchor.constant <= compactHeaderHeight{
            headerViewHeightAnchor.isActive = false
            headerViewHeightAnchor = headerView.heightAnchor.constraint(equalToConstant: compactHeaderHeight)
            headerViewHeightAnchor.isActive = true
            scrollView.scrollIndicatorInsets.top = compactHeaderHeight
        }
        
        
        if headerChange >= 0{
            scaleAnimation.fractionComplete = 1.0 - (compactHeaderHeight / headerChange)
        }
        
        
    }
    
    
    // Change judiciously with header...
    override open var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
}


