//
//  eventTableViewCell.swift
//  finalProj
//
//  Created by Ryan Nelson on 12/4/15.
//  Copyright © 2015 Ryan Nelson. All rights reserved.
//

import UIKit

class eventTableViewCell: UITableViewCell {

    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var clubTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
