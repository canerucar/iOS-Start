//
//  ViewController.swift
//  Kingfisher2
//
//  Created by Caner Uçar on 10.10.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageViewH: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        imageViewH.kf.indicatorType = .activity
//        imageViewH.kf.setImage(with: URL(string: "https://cdn.pixabay.com/photo/2016/02/05/04/49/australia-1180394_1280.jpg"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        
        setImg(image: imageViewH, imgLink: "https://cdn.pixabay.com/photo/2016/02/05/04/49/australia-1180394_1280.jpg")
    }

    func setImg(image: UIImageView?, imgLink: String) -> (){
        let url = URL(string: imgLink)
        
        image!.kf.indicatorType = .activity
        image!.kf.setImage(
            with: url,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }

}

