//
//  SponsorsTableViewController.swift
//  TechFest
//
//  Created by Zachary Shenkman on 3/10/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit
import SafariServices

class SponsorsTableViewController: UITableViewController {

    @IBAction func veritas(_ sender: Any) {
        let url = URL(string: "https://www.veritas.com/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func kensington(_ sender: Any) {
        let url = URL(string: "https://www.kensington.com/us/us/home")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func motorola(_ sender: Any) {
        let url = URL(string: "https://www.motorolasolutions.com/en_us.html")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func udt(_ sender: Any) {
        let url = URL(string: "https://udtonline.com/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func aaa(_ sender: Any) {
        let url = URL(string: "https://autoclubsouth.aaa.com/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func convergys(_ sender: Any) {
        let url = URL(string: "https://www.convergys.com/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func lockheed(_ sender: Any) {
        let url = URL(string: "https://www.lockheedmartin.com/us.html")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func nsc(_ sender: Any) {
        let url = URL(string: "https://www.simulationinformation.com/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func verizon(_ sender: Any) {
        let url = URL(string: "https://www.verizonwireless.com/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func astronics(_ sender: Any) {
        let url = URL(string: "https://www.astronics.com/about/subsidiary?subsidiaryItem=astronics%20test%20systems")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func certiport(_ sender: Any) {
        let url = URL(string: "https://certiport.pearsonvue.com/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func ecpi(_ sender: Any) {
        let url = URL(string: "https://www.ecpi.edu/locations/orlando-lake-mary-fl")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func ea(_ sender: Any) {
        let url = URL(string: "https://www.ea.com/careers/careers-overview/orlando")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func embryriddle(_ sender: Any) {
        let url = URL(string: "https://erau.edu/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func fullsail(_ sender: Any) {
        let url = URL(string: "https://www.fullsail.edu/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func hp(_ sender: Any) {
        let url = URL(string: "http://www.hp.com/country/us/en/welcome.html")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func montreat(_ sender: Any) {
        let url = URL(string: "https://www.montreat.edu/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func rlh(_ sender: Any) {
        let url = URL(string: "http://floridaspecs.org/rlh-management/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func ssc(_ sender: Any) {
        let url = URL(string: "https://www.seminolestate.edu/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func dave(_ sender: Any) {
        let url = URL(string: "http://www.daveschool.com/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func truechoice(_ sender: Any) {
        let url = URL(string: "http://www.truechoicetelecom.com/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    @IBAction func marines(_ sender: Any) {
        let url = URL(string: "https://www.marines.com/")
        let webView: SFSafariViewController = SFSafariViewController(url: url!)
        present(webView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
  
    
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
