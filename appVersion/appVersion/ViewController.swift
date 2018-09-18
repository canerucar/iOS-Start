//
//  ViewController.swift
//  appVersion
//
//  Created by Caner Uçar on 14.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let kversion     = "CFBundleShortVersionString"
    
    @IBOutlet weak var versionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        versionLabel.text = getVersion()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getVersion() -> String
    {
        let dictionary = Bundle.main.infoDictionary!
        let version    = dictionary[kversion] as! String
        
        return "\(version)"
    }
   


}

