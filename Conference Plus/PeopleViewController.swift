//
//  PeopleViewController.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/21/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - Class Variables
    
    var peopleTableview:UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Table View Setup
        peopleTableview = UITableView(frame: CGRect())
        peopleTableview.translatesAutoresizingMaskIntoConstraints = false
        peopleTableview.dataSource = self
        peopleTableview.register(PeopleTableViewCell.self, forCellReuseIdentifier: "peopleCell")
        
        // Layout.
        self.view.addSubview(peopleTableview)
        peopleTableview.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        peopleTableview.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        peopleTableview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        peopleTableview.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 5
    }
    
    
  
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell") as! PeopleTableViewCell
        
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
