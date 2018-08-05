//
//  ViewController.swift
//  kullaniciKayitFormu
//
//  Created by Caner Uçar on 5.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordAgainText: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func kayitAction(_ sender: Any)
    {
        if nameText.text == ""
        {
            newAlert()
        }
        
        else if passwordText.text == ""
        {
            newAlert()
        }
        else if passwordAgainText.text == ""
        {
            newAlert()
        }
        else if passwordText.text != passwordAgainText.text
        {
            newAlert()
        }
        else
        {
            performSegue(withIdentifier: "ikinciSayfa", sender: nil)
        }
    }
    
    func newAlert()
    {
        let alert = UIAlertController(title: "HATA", message: "Zorunu Alanlar Boş Geçilemez", preferredStyle: UIAlertControllerStyle.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    

}

