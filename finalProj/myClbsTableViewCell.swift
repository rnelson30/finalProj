//
//  myClbsTableViewCell.swift
//  finalProj
//
//  Created by Ryan Nelson on 12/6/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit
import Parse

class myClbsTableViewCell: UITableViewCell {

    @IBOutlet weak var favClb: UILabel!
    @IBAction func removeClub(sender: AnyObject) {
        let user = PFUser.currentUser()
        
        var myArray = user?["Favorites"]
       // myArray = arrayRemovingObject(user?["Favorites"][out], fromArray:myArray )
        
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func arrayRemovingObject<U: Equatable>(object: U, fromArray:[U]) -> [U] {
        return fromArray.filter { return $0 != object }
    }
    
    func tblView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {

        out = indexPath.row
    }
    var out: Int?


}
