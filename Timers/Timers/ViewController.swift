//
//  ViewController.swift
//  Timers
//
//  Created by Caner Uçar on 6.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var time = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        timeLabel.text = String(counter)
        
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerFunction), userInfo: nil, repeats: true)
        
       
        
    }
    
    @objc func timerFunction(){
        timeLabel.text = String(counter)
        
        
        if counter == 0{
            time.invalidate()
            timeLabel.text = "Zaman doldu"
            
        }
        counter = counter-1
    }

}

