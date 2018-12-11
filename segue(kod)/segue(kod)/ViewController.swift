//
//  ViewController.swift
//  segue(kod)
//
//  Created by Caner Uçar on 1.12.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clicked(_ sender: Any) {
        
        let gidilecekVC = self.storyboard?.instantiateViewController(withIdentifier: "ikinciVC")
        
        self.present(gidilecekVC!, animated: true, completion: nil)
        
    }
    
}

