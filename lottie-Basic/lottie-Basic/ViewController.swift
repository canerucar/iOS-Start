//
//  ViewController.swift
//  lottie-Basic
//
//  Created by Caner Uçar on 31.10.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet private var animationView: LOTAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startAnimation()
    }
    
    func startAnimation()
    {
        animationView.setAnimation(named: "bb8")
        animationView.loopAnimation = true
        animationView.play()
    }


}

