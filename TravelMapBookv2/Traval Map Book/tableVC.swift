//
//  tableVC.swift
//  Traval Map Book
//
//  Created by Caner Uçar on 10.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import CoreData

class tableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var titleArray = [String]()
    var subtitleArray = [String]()
    var latitudeArray = [Double]()
    var longitudeArray = [Double]()
    var slectedTitle = ""
    var slectedSubtitle = ""
    var slectedLatitude : Double = 0
    var slectedLongitude : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        fetchData()

    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector (tableVC.fetchData), name: NSNotification.Name(rawValue: "newPlace"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        slectedTitle = titleArray[indexPath.row]
        slectedSubtitle = subtitleArray[indexPath.row]
        slectedLatitude = latitudeArray[indexPath.row]
        slectedLongitude = longitudeArray[indexPath.row]
        performSegue(withIdentifier: "tomapVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tomapVC" {
            let destinationVC = segue.destination as? mapVC
            destinationVC?.slectedTitle = self.slectedTitle
            destinationVC?.slectedSubtitle = self.slectedSubtitle
            destinationVC?.slectedLatitude = self.slectedLatitude
            destinationVC?.slectedLongitude = self.slectedLongitude
        }
    }
    
    @objc func fetchData(){
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        request.returnsObjectsAsFaults = false
        
        do
        {
          let results = try context.fetch(request)
          
            if results.count > 0 {
                self.titleArray.removeAll(keepingCapacity: false)
                self.subtitleArray.removeAll(keepingCapacity: false)
                self.latitudeArray.removeAll(keepingCapacity: false)
                self.longitudeArray.removeAll(keepingCapacity: false)
                
                for result in results as! [NSManagedObject]{
                    
                    if let title = result.value(forKey: "title") as? String {
                        self.titleArray.append(title)
                    }
                    if let subtitle = result.value(forKey:  "subtitle") as? String {
                        self.subtitleArray.append(subtitle)
                    }
                    if let latitude = result.value(forKey:  "latitude") as? Double {
                        self.latitudeArray.append(latitude)
                    }
                    if let longitude = result.value(forKey:  "longitude") as? Double {
                        self.longitudeArray.append(longitude)
                    }
                    
                    self.tableView.reloadData()
                    
                }
            }
            
            
          print("ok")
        }
        catch
        {
           print("error")
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleArray[indexPath.row]
        
        return cell
    }
    @IBAction func addMap(_ sender: Any) {
        slectedTitle = ""
        performSegue(withIdentifier: "tomapVC", sender: nil)
        
    }
    
}
