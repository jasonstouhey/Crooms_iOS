//
//  ViewController.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/13/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit
import SafariServices

let userDefaults = UserDefaults.standard


class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate, UIViewControllerPreviewingDelegate{
    
    
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let indexPath = collectionView.indexPathForItem(at: location)
        guard let cell = collectionView?.cellForItem(at: indexPath!) else { return nil }
        previewingContext.sourceRect = self.view.convert(cell.frame, from: collectionView)
        
        
        
        switch indexPath?.row {
        case 0?:
            return storyboard?.instantiateViewController(withIdentifier: "Sponsors") as! SponsorsTableViewController
        case 1?:
            return storyboard?.instantiateViewController(withIdentifier: "Workshops") as! WorkshopsViewController
        case 2?:
            return storyboard?.instantiateViewController(withIdentifier: "Maps") as! MapViewController
        case 3?:
            return storyboard?.instantiateViewController(withIdentifier: "about") as! AboutViewController
        case 4?:
            let svc = SFSafariViewController.init(url: URL(string: "http://techfest.croomsweb.org/app_privacy_policy/")!)
            return svc
        default:
            return storyboard?.instantiateViewController(withIdentifier: "Sponsors") as! SponsorsViewController
        }
    }
    
    
    @IBAction func settingsFunction(_ sender: Any) {
        self.navigationController?.view.addSubview(gradeSelectView)
        self.gradeSelectView.updateFocusIfNeeded()
        self.gradeSelectView.isHidden = false
        self.gradeSelectView.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.gradeSelectView.alpha = 1.0
        })
    }
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        self.show(viewControllerToCommit, sender: nil)
    }
    
    
    // MARK: - Class Variables
    
    var fileParser:JKJSONFile!
    var collectionView:UICollectionView!
    var collectionViewLayout:UICollectionViewFlowLayout!
    var transitionController:Transitioner! = Transitioner()
    
    var items:[String] = ["Sponsors","Workshops","Maps","Terms/Privacy Policy", "Event Feedback"]
    var images:[UIImage] = [#imageLiteral(resourceName: "Sponsors View-1"), #imageLiteral(resourceName: "Workshops View"), #imageLiteral(resourceName: "Map View"), #imageLiteral(resourceName: "Tech Image"), #imageLiteral(resourceName: "Tech Image")]
    
    @IBOutlet weak var gradeSelectView: UIVisualEffectView!
    
    @IBAction func nineButtonFunction(_ sender: UIButton) {
        setGrade(grade: 9)
    }
    
    @IBAction func tenButtonFunction(_ sender: UIButton) {
        setGrade(grade: 10)
    }
    
    @IBAction func elevenButtonFunction(_ sender: UIButton) {
        setGrade(grade: 11)
    }
    
    @IBAction func twelveButtonFunction(_ sender: UIButton) {
        setGrade(grade: 12)
    }
    
    func setGrade(grade: Int) {
        userDefaults.set(grade, forKey: "gradeLevel")
        userDefaults.set(true, forKey: "gradeLevelSet")
        userDefaults.synchronize()
        
        
        
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.gradeSelectView.alpha = 0.0
            }, completion: {Void in self.gradeSelectView.alpha = 0})
        }
        
        
    }
    
    // MARK: - Lifecycle
    
    func delay(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: closure
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if( traitCollection.forceTouchCapability == .available){
            
            registerForPreviewing(with: self, sourceView: view)
            
        }
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        _ = self.navigationController?.popToRootViewController(animated: false)
        
        let data = DataManager()
        print(data.workshops)
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        } else {
            // Fallback on earlier versions
        }
        
        self.title = "TechFest"
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: self.view.frame.width * 0.95, height: 150)
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        // Collection View Background
        collectionView.backgroundColor = UIColor.clear
        
        self.view.addSubview(collectionView)
        
        // Autolayout.
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // Shadow
        collectionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        collectionView.layer.shadowRadius = 10
        collectionView.layer.shadowOpacity = 0.5
        
        //self.gradeSelectView.alpha = 0.0
        
        userDefaults.synchronize()
        
         if (userDefaults.bool(forKey: "gradeLevelSet") == false) {
         self.gradeSelectView.updateFocusIfNeeded()
         self.view.addSubview(gradeSelectView)
         UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
         self.gradeSelectView.alpha = 1.0
         })
         } else if (userDefaults.bool(forKey: "gradeLevelSet") == true) {
            self.gradeSelectView.alpha = 0
         }
        
        
        navigationController?.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection View Data Source
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return items.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
        
        cell.titleLabel.text = items[indexPath.row]
        cell.headerImage.image = images[indexPath.row]
        
        
        // Cell Customization
        return cell
        
    }
    
    // MARK: - Collection View Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        if self.navigationController == nil{
            
        }else{
            switch indexPath.row {
            case 0:
                self.show(storyboard?.instantiateViewController(withIdentifier: "Sponsors") as! SponsorsTableViewController, sender: nil)
            case 1:
                self.show(storyboard?.instantiateViewController(withIdentifier: "Workshops") as! WorkshopsViewController, sender: nil)
                
            case 2:
                self.show(storyboard?.instantiateViewController(withIdentifier: "Maps") as! MapViewController, sender: nil)
            case 3:
                let svc = SFSafariViewController.init(url: URL(string: "http://techfest.croomsweb.org/app_privacy_policy/")!)
                self.present(svc, animated: true, completion: nil)
            default:
                self.show(storyboard?.instantiateViewController(withIdentifier: "Sponsors") as! SessionsViewController, sender: nil)
            }
        }
        
        
        
    }
    
    
    
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.barTintColor = UIColor().maroonColor()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = true
        
        transitionController.reverse = operation == .pop
        return transitionController
    }
    
}

