//
//  ViewController.swift
//  anahtarDugme-UISwitch
//
//  Created by Caner Uçar on 12.11.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var degerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        if switchOutlet.isOn{
            degerLabel.text = "Anahtar Açık"
            self.view.backgroundColor = UIColor.green
        }
        else{
            degerLabel.text = "Anahtar Kapalı"
            self.view.backgroundColor = UIColor.red
            
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        
        if sender.isOn{
            
            degerLabel.text = "Anahtar Açık"
            self.view.backgroundColor = UIColor.green
            
        }
        else{
            degerLabel.text = "Anahtar Kapalı"
            self.view.backgroundColor = UIColor.red
        }
        
        
    }
    


}

