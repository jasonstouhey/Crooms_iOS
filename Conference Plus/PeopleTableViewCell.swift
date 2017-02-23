//
//  PeopleTableViewCell.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/21/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    
    // MARK: - Class Variables
    
    var profilePictureView:UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profilePictureView = UIImageView()
        profilePictureView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureView.image = #imageLiteral(resourceName: "Generic Image")
        self.addSubview(profilePictureView)
        
        profilePictureView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profilePictureView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profilePictureView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profilePictureView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        profilePictureView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        profilePictureView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
        profilePictureView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        profilePictureView.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
