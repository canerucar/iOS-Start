//
//  ViewController.swift
//  slideMenu
//
//  Created by Caner Uçar on 27.11.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var menuIsHidden = true
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leadingConstraint.constant = -198
        
        menuView.layer.shadowOpacity = 0.5
        menuView.layer.shadowRadius = 6
        
    }

    @IBAction func toggleMenu(_ sender: UIBarButtonItem) {
        
        if menuIsHidden{
            
            leadingConstraint.constant = 0
            //animasyon
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
            }
            
        }
        else{
            leadingConstraint.constant = -198
            //animasyon
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
            }
            
        }
        menuIsHidden = !menuIsHidden
        
    }
    @IBAction func istanbulClicked(_ sender: Any) {
        
        leadingConstraint.constant = -198
        
    }
    
}

