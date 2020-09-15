//
//  PatientsTableViewCell.swift
//  Project
//
//  Created by Dishant Patel on 2020-04-05.
//  Copyright © 2020 Dishant Patel. All rights reserved.
//

import UIKit

class PatientsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var priorityLevelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
