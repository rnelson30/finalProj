//
//  detailsViewController.swift
//  finalProj
//
//  Created by Ryan Nelson on 11/17/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit
import Parse
import Bolts

class detailsViewController: UIViewController {
    
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var event: UILabel!
    @IBOutlet weak var loc: UILabel!
    @IBOutlet weak var des: UITextView!
    
    var eventData: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        if let eventData = eventData{
            event.text = eventData["Event"] as! String
            loc.text = eventData["Location"] as! String
            
            pic.image = UIImage(named:"movie.jpg")
            des.text = eventData["Description"] as! String
            des.scrollRangeToVisible(NSMakeRange(0, 1))
            
            print(eventData["Event"])
            print(eventData["Location"])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
