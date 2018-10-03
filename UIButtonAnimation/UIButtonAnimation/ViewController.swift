//
//  ViewController.swift
//  UIButtonAnimation
//
//  Created by Caner Uçar on 21.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet var buttons : [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func pulseClicked(_ sender: Any) {
        
        UIButton.animate(withDuration: 0.2,
                         animations: {
                            self.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.2, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
    
    }
    
    @IBAction func flashClicked(_ sender: Any) {
    }
    
    @IBAction func shakeClicked(_ sender: Any) {
    }
    

    
        func pulsate(){
            
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            
            pulse.duration = 0.6
            pulse.fromValue = 0.95
            pulse.toValue = 1.0
            pulse.autoreverses = true
            pulse.repeatCount = 2
            pulse.initialVelocity = 0.5
            pulse.damping = 1.0
            
        
        
    }

}

