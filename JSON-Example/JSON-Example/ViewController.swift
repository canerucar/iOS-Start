//
//  ViewController.swift
//  JSON-Example
//
//  Created by Caner Uçar on 14.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

let myURL = "http://bucayapimarket.com/json.php" //App transport security izni lazım https - Global URL

let url = URL(string: myURL)! //myURL'imi gerçek bir url'e çeviridk ! kesin böyle bir url'm var
let myData = try! Data(contentsOf: url) //Urlmizden gelen dataları bir değişkene atıyoruz - try! hata yakalama hata varsa hatayı bana ver
var jsonDecoder = JSONDecoder() // json verileri bir modelin içerisine atamak için JsonDecoder tipinde bir değişken oluşturuyoruz.

class ViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*Şimdi ise verileri oluşturmuş olduğumuz yapıya JsonDecoder ise dönüştürüyoruz. En son işlem olarak ise bu verilerin ilkini yazdırıyoruz.*/
        let kampanyalar = try? jsonDecoder.decode([Kampanya].self, from: myData)
        //Köşeli parantezimiz [Kampanya] json yapımız array yapısında olduğu için
        
        dump(kampanyalar?.first) //ilk kampanya verisi

//        if let kampanya = kampanyalar
//        {
//            print(kampanya)
//        }
    }
   



}

