//
//  secondViewController.swift
//  kullaniciKayitFormu
//
//  Created by Caner Uçar on 5.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    var name = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text =  "İsminiz : \(name)"
        
    }
    

}
