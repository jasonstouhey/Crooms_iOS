//
//  SessionsViewController.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/15/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class SessionsViewController: UIViewController {
    
    var headerImageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        headerImageView = UIImageView()
        self.view.addSubview(headerImageView)
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        headerImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        headerImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        headerImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.45).isActive = true
        headerImageView.image = #imageLiteral(resourceName: "classroom")
        
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
