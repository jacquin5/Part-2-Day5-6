//
//  RosterCellTableViewCell.swift
//  Offical Class Roster
//
//  Created by Jacquin Wynn Jr on 3/10/15.
//  Copyright (c) 2015 JMW. All rights reserved.
//

import UIKit

class RosterCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rosterLabel: UILabel!
    @IBOutlet weak var rosterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
