//
//  secondViewController.swift
//  yukariKaydir (Swipe Up)
//
//  Created by Caner Uçar on 10.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goLeft", sender: self)
    }

   

}
