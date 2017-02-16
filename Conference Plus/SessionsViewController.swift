//
//  SessionsViewController.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/15/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class SessionsViewController: UIViewController, UITableViewDataSource {
    
    var headerImageView:UIImageView!
    var sessionInformationTableView:UITableView!
    var headerLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        headerImageView = UIImageView()
        self.view.addSubview(headerImageView)
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        headerImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        headerImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        headerImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.45).isActive = true
        headerImageView.clipsToBounds = true
        headerImageView.contentMode = UIViewContentMode.scaleAspectFill
        headerImageView.image = #imageLiteral(resourceName: "classroom")
        
        // Tableview setup
        sessionInformationTableView = UITableView(frame: CGRect(), style: .grouped)
        self.view.addSubview(sessionInformationTableView)
        sessionInformationTableView.dataSource = self
        
        // Autolayout
        
        sessionInformationTableView.translatesAutoresizingMaskIntoConstraints = false
        sessionInformationTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        sessionInformationTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.55).isActive = true
        sessionInformationTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.addSubview(headerLabel)
        headerLabel.widthAnchor.constraint(equalTo: headerImageView.widthAnchor).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 0).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: headerImageView.leftAnchor, constant: 10).isActive = true
        
        headerLabel.textColor = UIColor.white
        headerLabel.font = UIFont.systemFont(ofSize: 32)
        headerLabel.text = "TITLE"
        
        // Shadow
        headerLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        headerLabel.layer.shadowRadius = 20
        headerLabel.layer.shadowOpacity = 2
        
                
    }
    
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "DESCRIPTION_CELL"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "INFO_SECTION_HEADER"
        default:
            return "DEFAULT"
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
