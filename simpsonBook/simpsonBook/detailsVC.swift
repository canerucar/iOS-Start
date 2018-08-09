//
//  detailsVC.swift
//  simpsonBook
//
//  Created by Caner Uçar on 9.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    
    var selectedSimpson = simpson()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedSimpson.name
        occupationLabel.text = selectedSimpson.occupation
        imageView.image = selectedSimpson.image

      
    }


}
