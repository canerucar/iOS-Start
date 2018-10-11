//
//  mainCell.swift
//  Aktuel
//
//  Created by Caner Uçar on 10.10.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class mainCell: UITableViewCell {

    @IBOutlet weak var marketlerImage: UIImageView!
    @IBOutlet weak var marketlerName: UILabel!
    @IBOutlet weak var brosurDate: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
