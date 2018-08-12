//
//  ViewController.swift
//  Döviz
//
//  Created by Caner Uçar on 11.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usd: UILabel!
    @IBOutlet weak var trylabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }


    @IBAction func Getir(_ sender: Any) {
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=3a192be1cad2ae6352d4dbfa6cecaa92&format=1")
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "Hata", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                if data != nil {
                    do {
                        let JSONResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,AnyObject>
                        DispatchQueue.main.async {
                           
                            let rates = JSONResult["rates"] as! [String:AnyObject]
                            
                            //para birimleri ekleye biliriz.
                            let turkparasi = String(describing: rates["TRY"]!)
                            self.trylabel.text = "TRY: \(turkparasi)"
                            
                            let amerikanparasi = String(describing: rates["USD"]!)
                            self.usd.text = "USD: \(amerikanparasi)"
                            
                        }
                    } catch {
                        
                    }
                    
                }
            }
            
        }
         task.resume()
    }
    

}

