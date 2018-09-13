//
//  ViewController.swift
//  kaydirmaHareketleri(SWIPE)
//
//  Created by Caner Uçar on 10.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        //the default direction is right
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        upSwipe.direction = .up
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        downSwipe.direction = .down
        
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downSwipe)
    }
    
    
    @objc func handleSwipe(sender:UISwipeGestureRecognizer)
    {
        if sender.state == .ended
        {
            switch sender.direction
            {
            case .right:
                view.backgroundColor = .red
            case .left:
                view.backgroundColor = .blue
            case .up:
                view.backgroundColor = .black
            case .down:
                view.backgroundColor = .yellow
            default:
                break
            }
        }
        
    }

    


}

