//
//  detailsCell.swift
//  Aktuel
//
//  Created by Caner Uçar on 17.10.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class detailsCell: UITableViewCell {

    @IBOutlet weak var detailsBackgroundImage: UIImageView!
    //detailsViewController Tableview Cell bağlantısı
    @IBOutlet weak var urunlerAciklama: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
