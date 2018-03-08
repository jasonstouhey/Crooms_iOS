//
//  WorkshopsViewController.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/17/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit
import STKit

var data = DataManager()

class WorkshopsViewController: STStrechViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Class Variables
    
    var workshopCollectionView:UICollectionView!
    var collectionViewFlowLayout:UICollectionViewFlowLayout!
    var workshops = DataManager().workshops
    var ninthWorkshops:[DataManager.workshopData]!
    var tenthWorkshops:[DataManager.workshopData]!
    var upperclassWorkshops:[DataManager.workshopData]!

    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workshops = DataManager().workshops
        
        ninthWorkshops = workshops!.filter{$0.grade[0] == 9}
        tenthWorkshops = workshops!.filter{$0.grade[0] == 10}
        upperclassWorkshops = workshops!.filter{$0.grade[0] == 11}
        
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        
        // Setup the collection view.
        collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: self.view.frame.width * 0.95, height: 150)
        workshopCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: collectionViewFlowLayout)
        
        workshopCollectionView.translatesAutoresizingMaskIntoConstraints = false
        workshopCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.view.addSubview(workshopCollectionView)
        
        workshopCollectionView.dataSource = self
        workshopCollectionView.delegate = self
        workshopCollectionView.register(WorkshopCollectionViewCell.self, forCellWithReuseIdentifier: "workshopCell")
        
        workshopCollectionView.backgroundColor = UIColor.clear
        
        // Collection View Layout.
        workshopCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        workshopCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        workshopCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        workshopCollectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        // Shadow
        workshopCollectionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        workshopCollectionView.layer.shadowRadius = 10
        workshopCollectionView.layer.shadowOpacity = 0.2
        self.headerTitleLabel.text = "Workshops"
        self.maxHeaderHeightMultiplier = 0.4
        var darkView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        headerImageView.addSubview(darkView)
        darkView.constrainEqual(toView: self.headerImageView)
        
        self.headerImage = #imageLiteral(resourceName: "project-newton-oakhill-interior.jpg")
        self.scrollView = workshopCollectionView
        self.compactHeaderHeight = 75
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        
        
        
        
    }
   
    
    // MARK: - Collection View Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        switch userDefaults.integer(forKey: "gradeLevel") {
        case 9:
            return ninthWorkshops.count
        case 10:
            return tenthWorkshops.count
        case 11:
            return upperclassWorkshops.count
        case 12:
            return upperclassWorkshops.count
        default:
            return workshops!.count
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workshopCell", for: indexPath) as! WorkshopCollectionViewCell
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        var currentWorkshop:DataManager.workshopData!
        
        switch userDefaults.integer(forKey: "gradeLevel") {
        case 9:
            currentWorkshop = ninthWorkshops[indexPath.row]
        case 10:
            currentWorkshop = tenthWorkshops[indexPath.row]
        case 11:
            currentWorkshop = upperclassWorkshops[indexPath.row]
        case 12:
            currentWorkshop = upperclassWorkshops[indexPath.row]
        default:
            currentWorkshop = workshops![indexPath.row]
        }
        
        
        cell.titleLabel.text = currentWorkshop.name
        cell.timeLabel.text = currentWorkshop.time
        cell.presenterLabel.text = currentWorkshop.presenter
        
        
        return cell
    }
    
    func displayMultiplesOnCell(array:[String]!,label:UILabel,prefix:String?){
        
        var compoundString = String()
        
        if prefix == nil{
            
            compoundString = String()
            
        }else{
            
            compoundString = prefix!
            
        }
        
        if array.count > 1{
            
            for thing in 0...array.count - 1{
                
                if array.last as String! == array[thing] {
                    compoundString += array[thing] 
                    label.text = compoundString
                }else{
                    compoundString += (array[thing] ) + ", "
                    label.text = compoundString
                }
                
                
            }
            
        }else{
            compoundString += array[0] 
            label.text = compoundString
            
        }

        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath)
        
    }
    
    
    
    func cellSizeChanged(indexPath:IndexPath!){
        
        UIView.animate(withDuration: 0.2, animations: {
            self.collectionViewFlowLayout.invalidateLayout()
            self.workshopCollectionView.layoutIfNeeded()
            self.workshopCollectionView.updateConstraints()
            
        })
        
        
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
