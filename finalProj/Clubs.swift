//
//  Clubs.swift
//  ClubApp
//
//  Created by Student 1 on 11/23/15.
//  Copyright © 2015 Matthew Orgill. All rights reserved.
//

import Foundation
import UIKit
import Parse

struct Clubs
{
    var name: String?
    var obj: PFObject?


init(name: String?)
{
    self.name = name
}
}