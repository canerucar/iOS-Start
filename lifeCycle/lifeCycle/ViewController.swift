//
//  ViewController.swift
//  lifeCycle
//
//  Created by Caner Uçar on 23.10.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*Bu fonksiyon bir UIViewController’ın hayat döngüsünde yalnızca 1 defa çalışır. Çağırıldığı zaman, ViewController’ınız oluşturulduğunu ve kendisine bağlı tüm IBOutlet’lerin hazır hale geldiğini bilirsiniz.
    Ayrıca internetten bir defalık veri çekmeniz gerekiyorsa bu iş için son derece uygun bir fonksiyondur.*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidload Çalıştı")
    }
    override func loadView(){
        super.loadView()
        print("benden öncekiler çalışmaz-LoadView Çalıştı")
    }
    /*UIViewController görüntülendikten hemen sonra çağrılır. Bir animasyonu başlatmak veya bir API’dan verilerin yüklenmeye başlaması için uygun bir noktadır.*/
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("Ekran geleceği zaman-viewDidAppear")
    }
    /*UIViewController görünmeden hemen önce çağrılır. Alanları gizlemek / göstermek veya ekranın görünmesinden önce her defasında olmasını istediğiniz işlemler için uygundur.*/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear Çalıştı")
    }
    
    
    /*viewWillAppear’a benzer olarak bu fonksiyon da bir UIViewController objesi ekrandan kaybolmadan hemen önce çalışır. viewWillAppear gibi bu fonksiyonda bir UIViewController objesinin hayat döngüsü boyunca birden fazla kez çalışabilir. Kullanıcı farklı bir sayfaya geçmeye başladığında çalışır.*/
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear Çalıştı")
    }
    
   /* Bir UIViewController objesi ekrandan kaybolduktan sonra bu fonksiyon çalışır. Kaybolduktan sonra arkada çalışmaya devam etmesini istemediğiniz işlemler için genellikle bu fonksiyonu override edersiniz.*/
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("viewDidDisappear Çalıştı")
    }
    


}

