//
//  feedCellVC.swift
//  instagramCloneFirebase
//
//  Created by Caner Uçar on 14.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class feedCellVC: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postText: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
