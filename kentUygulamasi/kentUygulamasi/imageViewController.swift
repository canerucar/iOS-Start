//
//  imageViewController.swift
//  kentUygulamasi
//
//  Created by Caner Uçar on 6.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var landmarkName = ""
    var landmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = landmarkImage
        nameLabel.text = landmarkName
    }


}
