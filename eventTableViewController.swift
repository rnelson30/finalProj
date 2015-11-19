//
//  eventTableViewController.swift
//  finalProj
//
//  Created by Ryan Nelson on 11/17/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit
import Parse
class eventTableViewController: UITableViewController {
    
    var eventData: [PFObject]?
    
    func refreshData() {
        
        let query2 = PFQuery(className:"NewEvent")
        query2.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if let objects = objects {
                
                self.eventData = objects
                self.tableView.reloadData()
            }
        }
        
        /*if let url = NSURL(string: "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson") {
            let session = NSURLSession.sharedSession()
            let download = session.dataTaskWithURL(url) {
                (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                
                //print(data)
                
                self.earthquakeData = JSON(data: data!)
                
                
                self.tableView.reloadData()
                
                let earthquake = self.earthquakeData!["features"][3]
                
                print(earthquake["properties"]["title"].stringValue)
                // print(self.earthquakeData?["features"][3]["properties"]["title"])
            }
            
            
            download.resume()
            
        }*/
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
        refreshData()
        
       /* let query2 = PFQuery(className:"NewEvent")
        query2.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if let objects = objects {
                //print(objects)
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if eventData != nil {
            return 1
        }
        
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let eventData = eventData {
            
            return eventData.count
        }

        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCell", forIndexPath: indexPath)

        // Configure the cell...
        let event = eventData![indexPath.row]
        cell.textLabel?.text = event["Event"] as! String
        print(event["Event"])

        return cell
    }
    

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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        /* if "seg" == segue.identifier {
        let dest = segue.destinationViewController as! segViewController
        let quake = earthquakeData![tableView.indexPathForSelectedRow!.row]
        
        dest.quake = quake
        }*/
        if let destination = segue.destinationViewController as? detailsViewController{
            if let selectedIndex = tableView.indexPathForSelectedRow?.row {
                destination.eventData  = eventData?[selectedIndex] 
                
            }
        }
    }


}
