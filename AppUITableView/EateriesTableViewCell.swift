//
//  EateriesTableViewCell.swift
//  AppUITableView
//
//  Created by Admin on 01.08.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class EateriesTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
