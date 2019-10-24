//
//  ViewController.swift
//  kodlaObjeOlustur
//
//  Created by Caner Uçar on 4.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    let myLabel = UILabel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //sadece main.storyboarddan sürükle bırakla değil bu şekilde kod ile de bir şeyler oluşturabiliriz
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
         //Label
        myLabel.text = "Breaking Bad?"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.1, y: height * 0.3, width:
            width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        
        //button
        let myButton = UIButton()
        myButton.frame = CGRect(x: width*0.2, y: height*0.5, width: width*0.6, height: 50)
        myButton.setTitle("Güncelle", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        view.addSubview(myButton)
        
        
        myButton.addTarget(self, action: #selector(ViewController.myAction) , for: UIControlEvents.touchUpInside)
        
        }
    
        @objc func myAction() {
        
        //myLabel.text = "Better Call Saul"
        
            if myLabel.text == "Breaking Bad?"{
                myLabel.text = "Better Call Saul"
            }else{
                myLabel.text = "Breaking Bad?"
            }
            
        }
}



