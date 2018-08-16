//
//  signInVC.swift
//  instagramCloneFirebase
//
//  Created by Caner Uçar on 13.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class signInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != ""
        {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                
                //error boş değilse
                
                if error != nil
                    {
                        let alert = UIAlertController(title: "HATA", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                        let okButton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
                        alert.addAction(okButton)
                        self.present(alert, animated: true, completion: nil)
                    }
                    else
                    {
                        //print(user?.email) hata aldığımdan dolayı alttakini yaptım
                        //print(user?.user.email)
                        //print("Başarılı")
                        
                        //Kullanıcı başarıyla giriş yaptığında
                        //self.performSegue(withIdentifier: "toTabBar", sender: nil)
                        
                        //Kullanıcı Girişini Hatırlama
                        UserDefaults.standard.set(user?.user.email, forKey: "user")
                        UserDefaults.standard.synchronize()
                        
                        let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                        delegate.rememberLogin()
                    }
                }
            
        }
        else
        {
            //Yanlışsa ekrana alert çıkart
            let alert = UIAlertController(title: "HATA", message: "Yanlış Kullanıcı adı ve Parola", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
       
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        //email ve parola boş değilse
        if emailText.text != "" && passwordText.text != ""
        {
            //Kullanıcı kayıt yapma işlemleri
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                
                //error boş değilse
                if error != nil
                {
                    let alert = UIAlertController(title: "HATA", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    //print(user?.email) hata aldığımdan dolayı alttakini yaptım
                    //print(user?.user.email)
                    //print("Başarılı")
                    
                    //Kullanıcı başarıyla giriş yaptığında
                    //self.performSegue(withIdentifier: "toTabBar", sender: nil)
                    
                    //Kullanıcı Girişini Hatırlama
                    UserDefaults.standard.set(user?.user.email, forKey: "user")
                    UserDefaults.standard.synchronize()
                    
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    delegate.rememberLogin()
                }
                
            
            }
        }
        else
        {
            //Yanlışsa ekrana alert çıkart
            let alert = UIAlertController(title: "HATA", message: "Yanlış Kullanıcı adı ve Parola", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
    
        
    }
    
}
