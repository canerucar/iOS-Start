//
//  detailsViewController.swift
//  Aktuel
//
//  Created by Caner Uçar on 11.10.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {

    @IBOutlet weak var marketAdlari: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        marketAdlari.text = mTuple[myIndex].1
    }
    

    

}
