//
//  CustomeTableViewCell.swift
//  CitiesOfTheWorld
//
//  Created by Tanveer Bashir on 12/24/15.
//  Copyright © 2015 Tanveer Bashir. All rights reserved.
//

import UIKit

class CustomeTableViewCell: UITableViewCell {

    @IBOutlet weak var countery:UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var counteryLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.setShadow(backView)
        //mainImage.contentMode = .ScaleAspectFill
    }
}
