//
//  ViewController.swift
//  Segues
//
//  Created by Caner Uçar on 5.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    var userName = ""
    
    @IBOutlet weak var nameTextFielt: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "viewSegue" {
            
            let destinationVC = segue.destination as! secondViewController
            destinationVC.name = userName
            
        }
        
        
    }

    @IBAction func saveClicked(_ sender: Any)
    {
        userName = nameTextFielt.text!
        performSegue(withIdentifier: "viewSegue", sender: nil)
    }
    
    
    
}

