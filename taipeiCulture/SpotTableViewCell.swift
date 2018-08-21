//
//  SpotTableViewCell.swift
//  taipeiCulture
//
//  Created by Jason Hsu on 2018/8/21.
//  Copyright © 2018 junchoon. All rights reserved.
//

import UIKit

class SpotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var spotImageView: UIImageView!
    @IBOutlet weak var spotName: UILabel!
    @IBOutlet weak var parkName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
