//
//  myClbsTableViewController.swift
//  finalProj
//
//  Created by Ryan Nelson on 12/5/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit
import Parse

class myClbsTableViewController: UITableViewController {
    
    var eventData: [PFObject] = []
    
    
    func refreshData() {
        
        let query2 = PFQuery(className:"NewEvent")
        query2.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if let objects = objects {
                self.eventData = []
                for object in objects{
                    let user = PFUser.currentUser()
                    if user?["Favorites"] != nil{
                        for var x = 0; x < user?["Favorites"].count; ++x {
                            if object["Club"] as? String == user?["Favorites"][x] as? String{
                                self.eventData.append(object)
                            }
                        }
                        
                    }
                }
            }
            
            self.tableView.reloadData()
            
        }
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshData()

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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       let user = PFUser.currentUser()
        if user?["Favorites"] != nil {
            return (user?["Favorites"].count)!
        }
        else{
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifiermyClbs", forIndexPath: indexPath) as! myClbsTableViewCell
        s = indexPath.row
        // Configure the cell...
        //let event = eventData[indexPath.row]
        let user = PFUser.currentUser()
        let clb = user!["Favorites"][indexPath.row]
        
        cell.favClb?.text = clb as? String
        
        return cell
    }
    var s: Int?

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
