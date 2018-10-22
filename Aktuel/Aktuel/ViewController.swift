//
//  ViewController.swift
//  Aktuel
//
//  Created by Caner Uçar on 8.10.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import GoogleMobileAds

//1.si assetsdeki resimler, 2.si Göstereceğimiz Labellar, 3.sü şimdilik öylesine
let mTuple = [("a101","Harca Harca Bitmez","28 Mart 2008"), ("bim","Toptan fiyatına, Perakende Satış","Mayıs 1995"), ("migros","Bu Benim Dünyam","1954, İstanbul"), ("hakmar","Kalite Bir Haktır","1997, İstanbul")];

var myIndex = 0


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    //TableView ve Admob Viewlarını tanımladık
    @IBOutlet weak var tableViewMain: UITableView!
    @IBOutlet weak var admobView: GADBannerView! //UIView yerine yazdık
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView delegate ve datasource bağlantıları
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
        let talep = GADRequest() //Reklam talep ediyoruz
        talep.testDevices = [kGADSimulatorID] //Simulatorde gerçek reklam göstermeyip admob tarafından kara listeye alınabilir
        admobView.adUnitID = "ca-app-pub-9535434814729620/7481015648"
        admobView.rootViewController = self
        admobView.load(talep)
        
        setupNavBar()
        
    }
    
    //NavigationBar Large Title
    func setupNavBar()
    {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    //Tableview kaç tane satır olacağını belirliyoruz
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mTuple.count
    }
    
    //Tableview satırlarında neler gözükecek
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let cell = tableViewMain.dequeueReusableCell(withIdentifier: "Cell") as! mainCell
        cell.marketlerImage.image = UIImage(named: mTuple[indexPath.row].0)
        cell.marketlerName.text = mTuple[indexPath.row].1
        cell.brosurDate.text = "\(mTuple[indexPath.row].2)"
        
        
        //seçilen cell'in arkaplan rengi /sonradan değişecektir
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView
        
        
        return cell
    }
    
    //Tableview satırına tıklandığında ne olacak
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        performSegue(withIdentifier: "detailsSegue", sender: self)
        
        
    }
    
   


}

