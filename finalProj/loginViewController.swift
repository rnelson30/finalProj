//
//  loginViewController.swift
//  finalProj
//
//  Created by Ryan Nelson on 12/3/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit
import Parse

class loginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func submitLog(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(username.text!, password: password.text!){
            (user: PFUser?, error: NSError?) -> Void in
            
            if user == nil{
                print(error)
            }
            else{
                self.performSegueWithIdentifier("loginSeg", sender: self)
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
