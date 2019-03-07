//
//  ViewController.swift
//  progressView-Example
//
//  Created by Caner Uçar on 23.12.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var minValue = 0
    var maxValue = 100
    var downloader = Timer()
    
    @IBOutlet weak var downloadPercent: UILabel!
    @IBOutlet weak var downloadBar: UIProgressView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startButtonclicked(_ sender: UIButton) {
        startButton.isEnabled = false
        downloader = Timer.scheduledTimer(timeInterval: 0.06, target: self, selector: (#selector(ViewController.updater)), userInfo: nil, repeats: true)
        
        downloadBar.setProgress(0, animated: false)
    }
    
    @objc func updater(){
        if minValue != maxValue{
            minValue += 1
            downloadPercent.text = "\(minValue)"
            downloadBar.progress = Float(minValue) / Float(maxValue)
        }
        else{
            startButton.isEnabled = true
            minValue = 0
            downloader.invalidate()
        }
    }
    
}

