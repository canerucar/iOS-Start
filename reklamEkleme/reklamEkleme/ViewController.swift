//
//  ViewController.swift
//  reklamEkleme
//
//  Created by Caner Uçar on 6.10.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    @IBOutlet weak var bannerReklam: GADBannerView! //UIView yerine GADBannerView yapıyoruz ki reklamlarımız görüntülensin
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let talep = GADRequest() //admob sisteminden reklam talep ediyoruz
        talep.testDevices = [kGADSimulatorID] //simulatorde gerçek reklam göstermiyoruz. kara listeye alınabiliriz
        
        
        bannerReklam.adUnitID = "ca-app-pub-9535434814729620/3333623748" //banner reklam idmiz
        bannerReklam.rootViewController = self
        bannerReklam.load(talep) //reklamı çağırıyoruzki bannerda gözüksün
        
        
        
        
    }


}

