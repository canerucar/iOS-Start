//
//  ViewController.swift
//  yukariKaydir (Swipe Up)
//
//  Created by Caner Uçar on 10.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(leftSwipe)
        
    }



    @objc func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goRight", sender: self)
    }
    

    


}

