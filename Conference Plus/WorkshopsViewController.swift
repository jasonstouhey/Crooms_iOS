//
//  WorkshopsViewController.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/17/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class WorkshopsViewController: UIViewController, UICollectionViewDataSource {
    
    // MARK: - Class Variables
    
    var workshopCollectionView:UICollectionView!
    var collectionViewLayout:UICollectionViewFlowLayout!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the collection view.
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: self.view.frame.width * 0.9, height: 90)
        workshopCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: collectionViewLayout)
        workshopCollectionView.translatesAutoresizingMaskIntoConstraints = false
        workshopCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.view.addSubview(workshopCollectionView)
        
        workshopCollectionView.dataSource = self
        workshopCollectionView.register(WorkshopCollectionViewCell.self, forCellWithReuseIdentifier: "workshopCell")
        
        workshopCollectionView.backgroundColor = UIColor.clear
        
        // Collection View Layout.
        workshopCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        workshopCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        workshopCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        workshopCollectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection View Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 15
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workshopCell", for: indexPath) as! WorkshopCollectionViewCell
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
