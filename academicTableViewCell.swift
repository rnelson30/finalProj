//
//  academicTableViewCell.swift
//  finalProj
//
//  Created by Ryan Nelson on 12/5/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit
import Parse

class academicTableViewCell: UITableViewCell {

    var club: Clubs?

    @IBAction func addClb(sender: AnyObject) {
        print(club?.name)
        let user = PFUser.currentUser()
        user?.addUniqueObject(club!.name!, forKey: "Favorites")
        //user?["Favorites"] = club?.name
        user?.saveInBackground()
        
    }
    @IBOutlet weak var clubTit: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
