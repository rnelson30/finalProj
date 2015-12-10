//
//  normRegisterViewController.swift
//  finalProj
//
//  Created by Ryan Nelson on 12/3/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit
import Parse

class normRegisterViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var pass1: UITextField!
   
    @IBOutlet weak var pass2: UITextField!
    
    @IBAction func Submit(sender: AnyObject) {
        if pass1.text != pass2.text {
            
            print("passwords do not match")
            return
        }
        else{
            if email.text!.hasSuffix("@calpoly.edu") {
                
                let user = PFUser()
                user.username = email.text
                user.password = pass1.text
                user.email = email.text
                user.signUpInBackground()
                
                
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
