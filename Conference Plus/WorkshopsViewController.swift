//
//  WorkshopsViewController.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/17/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class WorkshopsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Class Variables
    
    var workshopCollectionView:UICollectionView!
    var collectionViewFlowLayout:UICollectionViewFlowLayout!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the collection view.
        collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: self.view.frame.width * 0.9, height: 250)
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
        workshopCollectionView.layer.shadowOpacity = 0.5
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        
        
        
        
    }
   
    
    // MARK: - Collection View Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return appDelegate.dataModel.workshops.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workshopCell", for: indexPath) as! WorkshopCollectionViewCell
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        let title = (appDelegate.dataModel.workshops[indexPath.row]["Set \(indexPath.row + 1)"] as! Dictionary<String,Any>)["title"]!
        let presenter:[String] = (appDelegate.dataModel.workshops[indexPath.row]["Set \(indexPath.row + 1)"] as! Dictionary<String,Any>)["presenter"] as! [String]
        var presenterString = "By "
        var timeString = String()
        
        let room = ((appDelegate.dataModel.workshops[indexPath.row]["Set \(indexPath.row + 1)"] as! Dictionary<String,Any>)["room"] as! String)
        let grade = (appDelegate.dataModel.workshops[indexPath.row]["grade"] as! [Int])
        let grades = grade.map{
            String($0)
        }
        print(grade)
        
        
        displayMultiplesOnCell(array: presenter, label: cell.presenterLabel, prefix: "By ")
        displayMultiplesOnCell(array: grades, label: cell.gradeLabel, prefix: "Grades: ")
        
        
        
        print(title)
        print(presenter)
        print(room)
        
        
        
        cell.titleLabel.text = title as! String
        cell.timeLabel.text = "Room - \(room)"
        
        
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
                
                if array.last as! String! == array[thing] as! String{
                    compoundString += array[thing] as! String
                    label.text = compoundString
                }else{
                    compoundString += (array[thing] as! String) + ", "
                    label.text = compoundString
                }
                
                
            }
            
        }else{
            compoundString += array[0] as! String
            label.text = compoundString
            
        }

        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Workshops Expanded") as! WorkshopsXCViewController

    }
    
    func cellSizeChanged(indexPath:IndexPath!){
        
        UIView.animate(withDuration: 0.2, animations: {
            self.collectionViewFlowLayout.invalidateLayout()
            self.workshopCollectionView.layoutIfNeeded()
            self.workshopCollectionView.updateConstraints()
            
        })
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        
        
        let cell = collectionView.cellForItem(at: indexPath) as! WorkshopCollectionViewCell?
                
        if cell != nil{
            cell?.updateConstraints()
            cell?.setNeedsLayout()
            cell?.setNeedsDisplay()
            
            
            
            if cell?.isExpanded == true{
                cell?.backgroundColor = UIColor.red
                return CGSize(width: self.view.frame.width * 0.9, height: 250)
            }else{
                return CGSize(width: self.view.frame.width * 0.9, height: 100)
            }
            
        }
                
            
            
            
        
        
        return CGSize(width: self.view.frame.width * 0.9, height: 100)
        
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
