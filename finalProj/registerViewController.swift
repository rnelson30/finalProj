//
//  registerViewController.swift
//  finalProj
//
//  Created by Ryan Nelson on 12/3/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit
import Parse

class registerViewController: UIViewController, UIPickerViewDelegate {

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var adminClub: UITextField!
    @IBOutlet weak var pass1: UITextField!
    @IBOutlet weak var pass2: UITextField!
   
    @IBAction func submit(sender: AnyObject) {
        
        if pass1.text != pass2.text {
            
            print("passwords do not match")
            return
        }
        else{
            if email.text!.hasSuffix("@calpoly.edu") {
               
                let user = PFUser()
                if let cat = cat{
                let itemSelected = categories[cat]
                user["Cat"] = itemSelected
                    
                }
                else{
                    user["Cat"] = categories[0]
                }
                user.username = email.text
                user.password = pass1.text
                user.email = email.text
                user["Club"] = adminClub.text
                user.signUpInBackground()
                
                PFUser.logInWithUsernameInBackground(email.text!, password: pass1.text!){
                    (user: PFUser?, error: NSError?) -> Void in
                    
                    if user == nil{
                        print(error)
                    }
                    else{
                        self.performSegueWithIdentifier("loginSeg", sender: self)
                    }
                    
                }

                
                
            }
        }
        
    }
    
   // var pickerDataSource = ["Sports", "Academic", "Cultural/Religious", "Hobby/Social", "Health/Enviroment", "Agriculture/Social"]
    
    var categories = ["Sports", "Academic", "Cultural/Religious", "Hobby/Social", "Health/Environment", "Agriculture/Social"]
    
    
    
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
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return categories[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
       cat = row
        
        
    }
    var cat: Int?
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
