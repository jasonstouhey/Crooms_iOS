//
//  SponsorsViewController.swift
//  Conference Plus
//
//  Created by Zachary Shenkman on 3/5/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class SponsorsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    func setSize() {
        var contentRect = CGRect.zero
        for view in self.scrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        self.scrollView.contentSize = contentRect.size
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setSize()

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
