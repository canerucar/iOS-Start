//
//  ViewController.swift
//  popUp-Menu
//
//  Created by Caner Uçar on 13.11.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func menuAction(_ sender: Any) {
        
        let menu = UIAlertController(title: "Menü", message: "Bir içecek seçiniz", preferredStyle: .actionSheet)
        let secenek1 = UIAlertAction(title: "Kahve", style: .default, handler: {_ in})
        let secenek2 = UIAlertAction(title: "Süt", style: .default, handler: {_ in})
        let secenek3 = UIAlertAction(title: "Türk Kahvesi", style: .default, handler: {_ in})
        let secenet4 = UIAlertAction(title: "Hiç Biri", style: .destructive, handler: {_ in})
        let secenek5 = UIAlertAction(title: "Vazgeç", style: .cancel, handler: {_ in})
        
        
        menu.addAction(secenek1)
        menu.addAction(secenek2)
        menu.addAction(secenek3)
        menu.addAction(secenet4)
        menu.addAction(secenek5)
        
        self.present(menu, animated: true, completion: nil)
        
        
    }
    
}

