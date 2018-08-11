//
//  ViewController.swift
//  touchIDProject
//
//  Created by Caner Uçar on 11.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Gercekten siz misiniz?", reply: { (success, error) in
                
                if success == true {
                    self.statusLabel.text = "Success!"
                } else {
                    self.statusLabel.text = "No!"
                }
                
            })
            //deviceOwnerAuthenticationWithBiometrics telefonda tanımlı parmak izini al
        
        
       
        
    }

    }

}

