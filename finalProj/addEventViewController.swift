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

class addEventViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBAction func tapScreen(sender: AnyObject) {
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to:nil, from:nil, forEvent:nil)

    }
    @IBOutlet weak var imageView: UIImageView!
    
   /* @IBAction func uploadImageFromSource(sender: AnyObject){
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }*/
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //uploadImageText.titleLable?.text = "Change"
    }
    
    
    @IBAction func loadImageButton(sender: AnyObject) {
        
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
        /*imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
        imagePicker.delegate = self
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                imageView.contentMode = .ScaleAspectFit
                imageView.image = pickedImage
            }
            
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(picker: UIImagePickerController) {
            dismissViewControllerAnimated(true, completion: nil)
        }*/
    }
  
   // let imagePicker = UIImagePickerController()
    
    
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
        event["Club"] = PFUser.currentUser()!["Club"]
        //event.saveInBackground()
        Event.text = ""
        Time.text = ""
        Location.text = ""
        Description.text = ""
    //this is where adding an image to the submit events page starts
        
        if imageView.image == nil {
            //image is not included alert user
            print("Image not uploaded")
            event.saveInBackground()
        }
        else {
            //create an image data
            let imageData = UIImagePNGRepresentation(self.imageView.image!)
            //create a parse file to store in cloud
            
            let parseImageFile = PFFile(name: "uploaded_image.png", data: imageData!)
            
            event["imageFile"] = parseImageFile
            event.saveInBackgroundWithBlock({
                (success: Bool, error: NSError?) -> Void in
            })
           
           
        }
        
        
        
      /*  if imageView.image == nil{
            print("image doesnt exist")
        }
        else{
            var pic = PFObject(className: "Events")
            //pic["user"] = PFUser.currentUser()
            pic.saveInBackgroundWithBlock({(success: Bool, error: NSError?) -> Void in
                
                if error == nil{
                    
                    var imageData = UIImagePNGRepresentation(self.imageView.image!)
                    
                    var parseImageFile = PFFile(name:"uploaded_image.png", data: imageData!)
                    
                    pic["imageFile"] = parseImageFile
                    pic.saveInBackgroundWithBlock({(success: Bool, error: NSError?) -> Void in
                        
                        if error == nil{
                            print("uploaded")
                        }
                        else{
                            print(error)
                        }
                    })
                    
                }
                
                
                
            })
            
        }
            */
        
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
