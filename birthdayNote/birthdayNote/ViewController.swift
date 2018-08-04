//
//  ViewController.swift
//  birthdayNote
//
//  Created by Caner Uçar on 4.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var birthdayInput: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String
        {
            nameLabel.text = "name: \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String
        {
            birthdayLabel.text = "birthday: \(newBirthday)"
        }
        
    }

    @IBAction func saveClicked(_ sender: Any)
    {
        //küçük verileri oluşturması için bir veritabanı oluşturduk
        UserDefaults.standard.set(nameInput.text, forKey: "name")
        UserDefaults.standard.set(birthdayInput.text, forKey: "birthday")
        
        UserDefaults.standard.synchronize() //Yapılan işlemi kaydet
        
        nameLabel.text = "name: \(nameInput.text!)"
        birthdayLabel.text = "birthday: \(birthdayInput.text!)"
    }
    
    @IBAction func deleteClicked(_ sender: Any)
    {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil
        {
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.synchronize()
            nameLabel.text = "name: "
        }
        
        if (storedBirthday as? String) != nil
        {
            UserDefaults.standard.removeObject(forKey: "birthday")
            UserDefaults.standard.synchronize()
            birthdayLabel.text = "birthday: "
        }
    }
    

}

