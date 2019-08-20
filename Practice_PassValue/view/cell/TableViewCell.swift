//
//  TableViewCell.swift
//  Practice_PassValue
//
//  Created by yueh on 2019/8/20.
//  Copyright © 2019 yueh. All rights reserved.
//

import UIKit


//protocol TableViewCellDelegate: class {
//    func clickBtn(_ cell: TableViewCell)
//}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
//    weak var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    @IBAction func clickDeleteBtn(){
        
//        self.delegate?.clickBtn(self)
        
        
    }
}
