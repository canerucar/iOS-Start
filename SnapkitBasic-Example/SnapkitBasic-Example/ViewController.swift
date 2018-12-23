//
//  ViewController.swift
//  SnapkitBasic-Example
//
//  Created by Caner Uçar on 12.12.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //Label oluşturuyoruz
    
    var nameLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Snapkit Example"
        return label
        
    }()
    
    
    var deviceNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "iPhone X"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        // SnapKit’i kullanarak Auto Layout işlemi yapacağınız nesnenin öncelikle bir view’e subview olarak eklenmesi gerekiyor. Aksi taktirde çalışmayacağını constraintlerin eklenmeyeceğini göreceksiniz.
        view.addSubview(nameLabel)
        view.addSubview(deviceNameLabel)

        /*
        Kısıtlayıcı unsurları aşağıda belirliyoruz.
        width: labelın genişliği
        height: labelın uzunluğu
        centerX ile label'ı referans aldığımız view genişliğini baz alarak ortalıyoruz
        centerY ile label'ı referans aldığımız view uzunluğunu baz alarak ortalıyoruz
        */
        //Aşağıdaki gibi sadece Center ile kullanırsak hem X hem Y noktaları için bu işlemi yapar
        
        
        nameLabel.snp.makeConstraints { (make) in
            make.width.equalTo(140)
            make.height.equalTo(50)
            //make.center.equalTo(self.view)
            make.top.equalTo(self.view).offset(50)
            make.right.equalTo(-120)
            // CenterY üzerinde kullandığımız offset ile Y ekseni üzerinde label nesnemizi kaydırıyoruz.
            // Aynı şekilde - (negatif) offset vererekte kaydırabilirsiniz.
            
            //make.center.equalTo(self.view).offset(50)
            
            // Bottom ile anlayabileceğiniz gibi equalTo ile referans aldığın view'ın Y noktası üzerinde tanımladığınız offset kadar + - şekilde kaydırabilirsiniz.
            //make.bottom.equalTo(-150)


        }
        // Left ile X koordinatı üzerinde equalTo methodu ile istediğiniz nokta kadar kaydırabilirsiniz.
        // Aynı şekilde Right ile X koordinatına sağdan yaklaşarak istediğiniz nokta kadar kaydırabilirsiniz.
        deviceNameLabel.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.bottom.equalTo(nameLabel).offset(50)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        //Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
    }


}

