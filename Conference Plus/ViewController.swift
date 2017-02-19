//
//  ViewController.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/13/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Class Variables
    
    var fileParser:JKJSONFile!
    var collectionView:UICollectionView!
    var collectionViewLayout:UICollectionViewFlowLayout!
    var items:[String] = ["Sponsors","Workshops","Maps","About","Terms/Privacy Policy"]
    var images:[UIImage] = [#imageLiteral(resourceName: "Sponsors")]

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: self.view.frame.width * 0.9, height: 150)
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
        
               
        // Cell Customization
        return cell
        
    }
    
    // MARK: - Collection View Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){

        switch indexPath.row {
        case 2:
            self.show(storyboard?.instantiateViewController(withIdentifier: "Maps") as! MapViewController, sender: nil)

        default:
            self.show(storyboard?.instantiateViewController(withIdentifier: "Sponsors") as! SessionsViewController, sender: nil)


        }

    }
    
    
    

    
    

}

