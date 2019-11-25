//
//  DetailVC.swift
//  TableViewPractice
//
//  Created by Caner Uçar on 20.11.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailImage.image = UIImage(named: self.imageName)
    }
    
    func commonInit(_ imageName: String, title: String){
        self.imageName = imageName
        self.title = title
    }
}
