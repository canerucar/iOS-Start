//
//  ViewController.swift
//  Aktuel
//
//  Created by Caner Uçar on 8.10.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var tableViewMain: UITableView!
    @IBOutlet weak var admobView: GADBannerView! //UIView yerine yazdık
    
    let mTuple = [("a101","A-101","25"), ("bim","BİM","20"), ("migros","MİGROS","24")];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
        let talep = GADRequest() //Reklam talep ediyoruz
        talep.testDevices = [kGADSimulatorID] //Simulatorde gerçek reklam göstermeyip admob tarafından kara listeye alınabilir
        admobView.adUnitID = "ca-app-pub-9535434814729620/7481015648"
        admobView.rootViewController = self
        admobView.load(talep)
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mTuple.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        //cell.textLabel?.text = "Marketler"
        //return cell
        
        
        let cell = tableViewMain.dequeueReusableCell(withIdentifier: "Cell") as! mainCell
        cell.marketlerImage.image = UIImage(named: mTuple[indexPath.row].0)
        cell.marketlerName.text = mTuple[indexPath.row].1
        cell.brosurDate.text = "\(mTuple[indexPath.row].2)"
        return cell
    }
    
   


}

