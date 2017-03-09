//
//  AboutViewController.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 3/6/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    var stackView:ScrollableHeaderView!
    var paragraphStyle:NSParagraphStyle!
    
    override func viewDidLoad() {
        
        self.title = "About"
        
        stackView = ScrollableHeaderView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        stackView.headerLabel.text = "About Crooms"
        
        // Set Paragraph Style.
        paragraphStyle = NSParagraphStyle()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }


    
}
