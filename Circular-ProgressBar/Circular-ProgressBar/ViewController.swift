//
//  ViewController.swift
//  Circular-ProgressBar
//
//  Created by Caner Uçar on 24.12.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class ViewController: UIViewController {

    @IBOutlet weak var progressView: MBCircularProgressBarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.progressView.value = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 10.0){
            self.progressView.value = 50
        }
    }


}

