//
//  ViewController.swift
//  Colors
//
//  Created by Caner Uçar on 6.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func whiteClicked(_ sender: Any) {
        view.backgroundColor = UIColor.white
        
    }
    @IBAction func blackClicked(_ sender: Any) {
        view.backgroundColor = UIColor.black
    }
    @IBAction func blueClicked(_ sender: Any) {
        view.backgroundColor = UIColor.blue
    }
    @IBAction func redClicked(_ sender: Any) {
        view.backgroundColor = UIColor.red
    }
    @IBAction func yellowClicked(_ sender: Any) {
        view.backgroundColor = UIColor.yellow
    }
    
    
}

