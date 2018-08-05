//
//  ViewController.swift
//  alertMessages
//
//  Created by Caner Uçar on 5.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button(_ sender: Any)
    {
        let alertMessages = UIAlertController(title: "UYARI", message: "Ciddi Sıkıntılar Var", preferredStyle: UIAlertControllerStyle.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
        alertMessages.addAction(okButton)
        self.present(alertMessages, animated: true, completion: nil)
    }
    
}

