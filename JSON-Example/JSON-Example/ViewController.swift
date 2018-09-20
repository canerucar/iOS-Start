//
//  ViewController.swift
//  JSON-Example
//
//  Created by Caner Uçar on 14.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

let myURL = "http://bucayapimarket.com/json.php" //transport security izni lazım https

let url = URL(string: myURL)!
let myData = try! Data(contentsOf: url)
var jsonDecoder = JSONDecoder()

class ViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let kampanyalar = try? jsonDecoder.decode([Kampanya].self, from: myData)
        
        //dump(kampanyalar?.first) //ilk kampanya verisi
        
        
        if let kampanya = kampanyalar
        {
            print(kampanya)
        }
        
    
        
    }
   



}

