//
//  addEventViewController.swift
//  finalProj
//
//  Created by Ryan Nelson on 11/19/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit
import Parse
import Bolts

class addEventViewController: UIViewController {

    @IBAction func tapScreen(sender: AnyObject) {
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to:nil, from:nil, forEvent:nil)

    }
    
    @IBOutlet weak var Event: UITextField!
    
    @IBOutlet weak var Time: UITextField!
    
    @IBOutlet weak var Location: UITextField!
    
    @IBOutlet weak var Description: UITextView!
    
    @IBAction func Submit(sender: AnyObject) {
        let event = PFObject(className: "NewEvent")
        event["Event"] = Event.text!
        event["Time"] = Time.text!
        event["Location"] = Location.text!
        event["Description"] = Description.text!
        
        event.saveInBackground()
        Event.text = ""
        Time.text = ""
        Location.text = ""
        Description.text = ""
    
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.Description.layer.borderColor = UIColor.grayColor().CGColor
        self.Description.layer.borderWidth = 0.5
        self.Description.layer.cornerRadius = 8
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
