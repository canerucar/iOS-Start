//
//  ViewController.swift
//  Cihaz Titreşimi (Vibrate)
//
//  Created by Caner Uçar on 17.12.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func titresim1Clicked(_ sender: Any) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    @IBAction func titresim2Clicked(_ sender: Any) {
        AudioServicesPlaySystemSound(1520)
    }
    @IBAction func titresim3Clicked(_ sender: Any) {
        AudioServicesPlaySystemSound(1521)
    }
    @IBAction func iPhone7Ustu(_ sender: Any) {
        let titremeUret = UIImpactFeedbackGenerator(style: .heavy)
        titremeUret.impactOccurred()
    }
    
}

