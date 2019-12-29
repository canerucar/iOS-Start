//
//  ViewController.swift
//  tableView
//
//  Created by Caner Uçar on 24.08.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//
//Ekrandaki verileri listelemek için kullanılan bir öğe - Tableview tıklayarak seperator none yaparsak tableview çizgileri gidiyor.

import UIKit

//Tableviewi kullanmak için protocoolleri eklememiz gerekiyor
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var sehirler = ["Samsun","Ordu","Trabzon","Rize","Artvin","Sinop"]
    var plaka = ["55","52","61","53","08","57"]
    
    //Kaç adet satırımız olacak
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirler.count
    }
    
    //Cell'i tanımlarız
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        //indexPath = hangi satıra tıkladığımız
        
        //Cell ile ilgili işlemler
        cell.textLabel?.text = sehirler[indexPath.row]
        cell.detailTextLabel?.text = plaka[indexPath.row]
        return cell
    }
    //Cell işlemler
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //Cell tıklandığında
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row+1). Satıra tıklandı")
    }
    
    //deselectRowAt - Çıkarma işlemi gibi
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("\(indexPath.row+1). Satıra tıklandı")
    }


}

