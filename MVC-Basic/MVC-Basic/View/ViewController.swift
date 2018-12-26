//
//  ViewController.swift
//  MVC-Basic
//
//  Created by Caner Uçar on 19.12.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var Kodu: UILabel!
    @IBOutlet weak var alisFiyati: UILabel!
    @IBOutlet weak var satisFiyati: UILabel!
    @IBOutlet weak var guncellemeTarihi: UILabel!
    
    
    var money = Money()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        printScreen()
    }
    
    func printScreen(){
        
        self.fullName.text = money.full_name
        self.Kodu.text = money.code
        self.alisFiyati.text = money.buyingString
        self.satisFiyati.text = money.sellingString
        self.guncellemeTarihi.text = money.dateString
        
    }


}

