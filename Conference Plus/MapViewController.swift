//
//  MapViewController.swift
//  Conference Plus
//
//  Created by Zachary Shenkman on 2/17/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func btn1Function(_ sender: UIButton) {
        btn1.setImage(#imageLiteral(resourceName: "btn1selected"), for: .normal)
        btn2.setImage(#imageLiteral(resourceName: "btn2"), for: .normal)
        imageView.image = #imageLiteral(resourceName: "map1")
        self.scrollView.setZoomScale(1.0, animated: false)
    }

    @IBAction func btn2Function(_ sender: UIButton) {
        btn2.setImage(#imageLiteral(resourceName: "btn2selected"), for: .normal)
        btn1.setImage(#imageLiteral(resourceName: "btn1"), for: .normal)
        imageView.image = #imageLiteral(resourceName: "map2")
        self.scrollView.setZoomScale(1.0, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0


    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
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
