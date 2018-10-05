//
//  placesVC.swift
//  parseFoursquareClone
//
//  Created by Caner Uçar on 14.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import Parse

class placesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var placesNameArray = [String]()
    
    var chosenPlace = ""
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()

        
    }
    
    func getData()
    {
        //Parse da nereye kayıtlıysa onun adını ekliyoruz
        let query = PFQuery(className: "Places")
        query.findObjectsInBackground { (objects, error) in
            
            if error != nil
            {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                //başka bir veri varsa ondan kurtulmak için
                self.placesNameArray.removeAll(keepingCapacity: false)
                
                for object in objects!
                {
                    self.placesNameArray.append(object.object(forKey: "name") as! String)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    //seçilen veriyi detailsVC ye aktarma
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromplacesVCtodetailsVC"
        {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedPlace = self.chosenPlace
        }
    }
    
    //bir yer seçilince ne olacak
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //seçtiğimiz yeri değişkene atadık
        self.chosenPlace = placesNameArray[indexPath.row]
        
        self.performSegue(withIdentifier: "fromplacesVCtodetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = placesNameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesNameArray.count
    }

    @IBAction func logoutClicked(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "userLoggedIn")
        UserDefaults.standard.synchronize()
        
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "signInVC") as! signInVC
        
        let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = signInVC
        delegate.rememberLogIn()
        
    }
    
    
    @IBAction func addClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "fromplacesVCtoimageVC", sender: nil)
        
    }
    
    
}
