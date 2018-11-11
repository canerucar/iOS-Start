//
//  ViewController.swift
//  view-LabelSize
//
//  Created by Caner Uçar on 8.11.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labels: UILabel!
    @IBOutlet weak var satinAlOutlet: UIButton!
    @IBOutlet weak var arkadasinaÖner: NSLayoutConstraint!
    @IBOutlet weak var nameLabel: UILabel!
    
    var bulut = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labels.text = " Wesley Sneijder, Hollandalı futbolcudur. Ofansif orta saha pozisyonunda görev yapan oyuncu, Hollanda millî futbol takımında da oynamaktadır. UEFA tarafından, 2009-10 sezonunun en iyi orta saha oyuncusu ve 2010'da FIFA tarafından en iyi üç orta saha oyuncusundan biri olarak seçildi.Hollanda millî futbol takımında da oynamaktadır. UEFA tarafından, 2009-10 sezonunun en iyi orta saha oyuncusu ve 2010'da FIFA tarafından en iyi üç orta saha oyuncusundan biri olarak seçildi."
        
        
        nameLabel.text = "Wesley Armando Maradona Ronaldı Sneijder"
        
    }
    
    
    
    @IBAction func arkadasOner(_ sender: Any) {
       
        if bulut<=0 {
            satinAlOutlet.isHidden = true
            arkadasinaÖner.constant = -30
        }
        else
        {
            satinAlOutlet.isHidden = false
        }
        
        
    }
    
    

}


