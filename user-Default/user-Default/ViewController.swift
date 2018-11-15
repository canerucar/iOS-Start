//
//  ViewController.swift
//  user-Default
//
//  Created by Caner Uçar on 7.11.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySwitch.isOn = false //önce switch kapalı
    }

    
    @IBAction func buttonClicked(_ sender: Any) {
        
        let username = usernameTF.text!
        let password = passwordTF.text!
        
        //Bilgileri kontrol et
        if username == "Caner" && password == "1234"{
            
            if mySwitch.isOn == true{
                let defaults = UserDefaults.standard
                defaults.set(username, forKey: "userKey")
                defaults.set(password, forKey: "passKey")
            }
            
            //Anasayfaya git
            
            performSegue(withIdentifier: "loginSegue", sender: nil)
            
        }
        
        
        
        
    }
    //Şimdi uygulama açılmadan önce UserDefaults da belirlediğimiz anahtar kelime var mı diye kontrol edeceğiz.Eğer varsa bu daha önce başarılı giriş yaptığı anlamına geliyor.Bu yüzden bu durumda kullancı adı ve parola TextField larına UserDefaults daki verileri yazdıracağız.Eğer UserDefaults da veri bulunmuyorsa TextField ları boş bırakacağız. Kodu inceleyelim:
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //UserDefaults verilerini getir
        let defaults = UserDefaults.standard
        let usrMail = defaults.string(forKey: "userKey")
        let usrPass = defaults.string(forKey: "passKey")
        
        if usrMail != "" && usrPass != ""{
            usernameTF.text = usrMail
            passwordTF.text = usrPass
        }
        
    }
}


