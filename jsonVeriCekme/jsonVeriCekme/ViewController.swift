//
//  ViewController.swift
//  jsonVeriCekme
//
//  Created by Caner Uçar on 11.10.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Json datamızı URL'e atıyoruz
           let url = URL(string:"https://jsonplaceholder.typicode.com/posts")!
           let gelenData = try! Data(contentsOf: url)
           let jsonDecoder = JSONDecoder()
        
//        Şimdi ise verileri oluşturmuş olduğumuz yapıya JsonDecoder ise dönüştürüyoruz. En son işlem olarak ise bu verilerin ilkini yazdırıyoruz.
        let veriler = try? jsonDecoder.decode([Veriler].self, from: gelenData)
        dump(veriler?.last)
    }


}

