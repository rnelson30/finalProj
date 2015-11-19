//
//  ViewController.swift
//  finalProj
//
//  Created by Ryan Nelson on 11/12/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    
    
    
    
    
    

    override func viewDidLoad() {
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }

      /*  let query2 = PFQuery(className:"NewEvent")
        query2.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if let objects = objects {
                print(objects)
                for obj in objects {
                    print(obj["Event"])
                }
            }
        }*/

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

