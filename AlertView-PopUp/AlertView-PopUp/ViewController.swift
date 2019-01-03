//
//  ViewController.swift
//  AlertView-PopUp
//
//  Created by Caner Uçar on 12.12.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Seçim Şansı Sunma Vakti Geldi", message: "Napıyoz Yurtdışı Falan?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Almanya", style: .default, handler: { (action) in
            print("Almanya Seçildi")
        }))
        alert.addAction(UIAlertAction(title: "Ameriga", style: .destructive, handler: { (action) in
            print("Ameriga Falan")
        }))
        alert.addAction(UIAlertAction(title: "Aman Salla", style: .cancel, handler: { (action) in
            print("Boşver Seçildi")
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

