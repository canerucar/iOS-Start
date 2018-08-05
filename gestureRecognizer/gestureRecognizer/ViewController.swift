//
//  ViewController.swift
//  gestureRecognizer
//
//  Created by Caner Uçar on 5.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var isWalterOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true //tıklanabilir olduğunu belirttik
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
        
        @objc func changePic() {
            
            if isWalterOn == true {
                imageView.image = UIImage(named: "breaking.jpg")
                nameLabel.text = "Breaking Bad"
                isWalterOn = false
            } else if isWalterOn == false {
                imageView.image = UIImage(named: "better.jpg")
                nameLabel.text = "Better Call Saul"
                isWalterOn = true
            }
        
        
        
    }

}

