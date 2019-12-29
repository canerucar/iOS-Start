//
//  NewsTableViewCell.swift
//  haberApp
//
//  Created by Caner Uçar on 15.09.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var url: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
