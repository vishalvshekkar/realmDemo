//
//  ContactsTableViewCell.swift
//  RealmDemo
//
//  Created by Vishal V Shekkar on 10/08/16.
//  Copyright © 2016 Vishal. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leftImageView.layer.cornerRadius = 26.5
        leftImageView.layer.borderColor = UIColor(colorType: .PinkishRed).CGColor
        leftImageView.layer.borderWidth = 1
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if highlighted {
            self.backgroundColor = UIColor(colorType: .PinkishRedWithLowerAlpha)
        } else {
            self.backgroundColor = UIColor.clearColor()
        }
    }

}
