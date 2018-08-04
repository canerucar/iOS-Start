//
//  secondViewController.swift
//  Segues
//
//  Created by Caner Uçar on 5.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameLabel.text = "Name is: \(name)"

      
    }

    @IBAction func backClicked(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    


}
