//
//  ViewController.swift
//  tarih-Saat
//
//  Created by Caner Uçar on 12.11.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tarihLabel: UILabel!
    @IBOutlet weak var saatLabel: UILabel!
    
    var tarihFormatter = DateFormatter()
    var saatFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saatFormatter.timeStyle = .medium
        tarihFormatter.dateStyle = .medium
        
        tarihFormatter.locale = Locale(identifier: "TR")
        
        saatLabel.text = saatFormatter.string(from: Date())
        tarihLabel.text = tarihFormatter.string(from: Date())
    }


}

