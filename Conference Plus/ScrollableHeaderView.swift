//
//  ScrollableHeaderView.swift
//  Stacks
//
//  Created by Suneet Tipirneni on 3/5/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class ScrollableHeaderView: UIView,UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var textView:UITextView!
    var imageView:UIImageView!
    var imageViewHeight:NSLayoutConstraint!
    var imageViewTopAnchor:NSLayoutConstraint!
    var headerLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        self.addSubview(scrollView)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        scrollView.addSubview(stackView)
        
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        
        imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "project-newton-oakhill-interior.jpg")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
        imageViewTopAnchor = imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 64)
        imageViewTopAnchor.isActive = true
        imageViewHeight.isActive = true
        
        textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(textView)
        textView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        //text.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.2).isActive = true
        
        textView.isScrollEnabled = false
        
        textView.text = "Crooms Academy of Information Technology began as Crooms High School. It was founded by one of the nation's outstanding pioneers of education for black students, Professor Joseph Nathaniel Crooms. A graduate of Hampton University and Florida A & M University, Crooms was known for his untiring efforts and energies in the promotion of education for black youth in Florida, as well as the development of schools in Sanford, Florida. In 1910, Crooms obtained approval for a new school building. He developed the plans and selected the school site. In 1926, Crooms Academy was constructed as a high school for black students. It was named after Professor Crooms by a community grateful for his dedication and energy in pursuit of educational opportunity for its students.The mission of Crooms Academy of Information Technology is to provide innovative teaching and learning in a technology-enriched environment and to engage students in an academically challenging curriculum that prepares them for post-secondary education with industry-validated technology skills.Crooms Academy of Information Technology is Seminole County Public Schools only dedicated magnet high school. All students who reside in Seminole County and have successfully completed the 8th grade may apply for admission. Students must submit the High School Magnet Program Application through SCPS Choices Department and be chosen in the random selection process.The school offers a well-rounded high school experience with a rigorous academic program and technology focused coursework in different areas of information technology. Computer programming, digital design, game development, 3D Modeling & Animation, iOS and Android app development, and network systems technology are just some of the technological courses offered by our magnet program. Crooms students benefit from a small school environment and individualized attention, opportunities to earn college credit through the Early College program at Seminole State College of Florida and Advanced Placement Coursework. A partnership with Seminole State College offers a pathway allowing students to earn the Associate of Arts degree in Information Technology while earning their high school diploma.Students have the opportunity to earn technology certifications as an Adobe Certified Associate in Dreamweaver, Flash, Photoshop, Premiere Pro, InDesign, and Illustrator; Cisco Certified Network Associate (CCNA);  CompTIA A+, Linux+, Network+, Security+; Microsoft Office Specialist (MOS); Microsoft Technical Associate (MTA) in Windows Operating System Fundamentals; Autodesk 3ds Max; National Center for Simulation Modeling and Simulation; and Oracle Certified Associate.Crooms Academy of IT is the highest performing high school in Seminole County and has a school grade of “A” on Florida’s High School Accountability Report.   The school is ranked as one of the top 10% of the highest performing high schools within the state of Florida.  Crooms Academy of IT has been recognized as a Distinguished Academy for the past six years by the National Academy Foundation and has recently been honored as a Magnet School of Distinction by Magnet Schools of America.  The school has been consistently recognized as one of the best high schools in the US by US News and World Report and is listed on the Washington Post’s list of Most Challenging High Schools.  Crooms Academy of IT is also ranked No. 1 in the nation on US News and World Report’s rankings of Most Connected Classrooms. Demetria Faison, the principal, was selected as a finalist for the 2016-2017 Innovative Principal of the Year award.For more information about the Crooms Business Advisory Council visit CroomsBac.org About TechFest. TechFest is the signature event of the Crooms Business Advisory Council (BAC). In the eleventh year, TechFest has raised over $209,000.  The proceeds supports scholarships, curriculum, career and college related programs, job shadowing field trips and internship opportunities.  Over $106,000 in scholarships have been awarded Crooms graduates.Students will have the opportunity to network with two keynote speakers along with over thirty workshops presenters and the sponsors in the exhibition hall area.  TechFest allows students, teachers and the business community to explore the \"wow\" in IT.  This is a great opportunity for all participants to come together and share valuable information and resources in order to grow the future pipeline for high tech careers. On behalf of Crooms AOIT, we want to thank our business community for recharging, connecting and investing in our students and teachers.  Community engagement and collaboration is the best way to build relationships.TechFest, it’s your Hi-Tech Community, Get into IT!"
        textView.sizeToFit()
        
        headerLabel = UILabel()
        imageView.addSubview(headerLabel)
        headerLabel.text = "HEADER_TITLE"
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 40)
        headerLabel.textColor = UIColor.white
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        headerLabel.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        headerLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        headerLabel.layer.shadowRadius = 10
        headerLabel.layer.shadowOpacity = 2
        

        
    }
    
    func updateHeader(){
        
            }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
       
        let change = scrollView.contentOffset.y + 64
        
        if change < 0{
            imageViewHeight.isActive = false
            imageViewTopAnchor.isActive = true
            imageViewHeight = imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2 + (-change / self.frame.height))
            imageViewHeight.isActive = true
            
        }else if change > 0{
            imageViewTopAnchor.isActive = false
            imageViewHeight = imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2 + (-change / self.frame.height))
            imageViewHeight.isActive = true
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
    }

}
