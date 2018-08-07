//
//  ViewController.swift
//  kentUygulamasi
//
//  Created by Caner Uçar on 6.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    
    var selectedLandMarkName = ""
    var selectedLandMarkImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        landMarkNames.append("ankara")
        landMarkNames.append("istanbul")
        landMarkNames.append("izmir")
        landMarkNames.append("ordu")
        
        landMarkImages.append(UIImage(named:"ankara.jpg")!)
        landMarkImages.append(UIImage(named: "istanbul.jpg")!)
        landMarkImages.append(UIImage(named: "izmir.jpg")!)
        landMarkImages.append(UIImage(named: "ordu.jpg")!)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count//kaç satır olacağo
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
            landMarkNames.remove(at: indexPath.row)
            landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = landMarkNames[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toimageVC" {
            
            let destinationVC = segue.destination as! imageViewController
            destinationVC.landmarkName = selectedLandMarkName
            destinationVC.landmarkImage = selectedLandMarkImages
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
        selectedLandMarkName = landMarkNames[indexPath.row]
        selectedLandMarkImages = landMarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toimageVC", sender: nil)
    }
    
    

}

