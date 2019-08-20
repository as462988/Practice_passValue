//
//  TableViewCell.swift
//  Practice_PassValue
//
//  Created by yueh on 2019/8/20.
//  Copyright © 2019 yueh. All rights reserved.
//

import UIKit



class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
//    weak var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
