//
//  WorkshopsXCViewController.swift
//  Conference Plus
//
//  Created by Zachary Shenkman on 2/21/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class WorkshopsXCViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var navTitle: UINavigationItem!

    func viewActuallyDidLoad(strName: String, strStartTime: String, strEndTime: String, strLocation: String, strDescription: String) {
        name.text = strName
        time.text = strStartTime + " to " + strEndTime
        location.text = strLocation
        navTitle.title = strName
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
