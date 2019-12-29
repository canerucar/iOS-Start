//
//  NewsDetailViewController.swift
//  haberApp
//
//  Created by Caner Uçar on 15.09.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var detailText: UILabel!
    
    //Önceki sayfadan alacağımız değeri buraya atayacağız
    var newsDetail:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailText.text = newsDetail
        
    }

}
