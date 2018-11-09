//
//  ViewController.swift
//  Rehbere-TelefonNumarası-Kaydetmek
//
//  Created by Caner Uçar on 6.11.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI



//CNContactViewControllerDelegate ile extend edelim
class ViewController: UIViewController, CNContactViewControllerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        //Butona bastığımızda kullanıcı bilgisini değişkenlerde tutalım
        let name = nameLabel.text!
        let phone = phoneLabel.text!
        let mail = mailLabel.text!
        
        saveContact(contactName: name, contactPhone: phone, contactMail: mail)

        
    }
    
    //Bu değişkenleri parametre olarak içini dolduracağımız saveContact fonksiyonuna göndereceğiz.
    func saveContact(contactName name:String,contactPhone phone: String, contactMail mail:String){
        
        //CNMutableContact instance yaratalım
        let newContact = CNMutableContact()
        
        //E-posta adresini belirtelim
        let homeEmail = CNLabeledValue(label:"E-mail:", value: "\(mail)" as NSString)
        
        //E-Posta adresini contact bilgisine kayıt edelim
        //istersek başka e-mail adresleri de ekleyelim ',' ile ayırabiliriz
        
        //Telefon numarası alalım.
        //Extension modülünü burada kullanacağız, phone.digits ile phone değeri içindeki rakamları almış olduk
        
        newContact.emailAddresses = [homeEmail]
        newContact.phoneNumbers = [CNLabeledValue(
            label: "Phone Number:",
            value:CNPhoneNumber(stringValue:"\(phone.digits)"))]
        
        //Kişinin profil resmini belirlemek isterseniz aşağıdaki kodu kullanabilirsiniz
        //newContact.imageData = UIImagePNGRepresentation(UIImage(named: "pictureName")!)
        
        //İsim bilgisini kaydedelim
        newContact.givenName = name
        newContact.familyName = "Developer"
        
        //Present etmek üzere ContactViewController oluşturalım ve bilgileri bunun içine gönderelim
        let contactVC = CNContactViewController(forUnknownContact: newContact)
        contactVC.contactStore = CNContactStore()
        
        contactVC.delegate = self
        contactVC.allowsActions = false
        
        //Present edelim ve uygulamadan cihaza geçiş yapalım
        let navigationController = UINavigationController(rootViewController: contactVC)
        self.present(navigationController, animated: true, completion: nil)
        
        
        
    }
    //İşimiz bittiğinde geri dönsün
    func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


//Bu extension sayesinde istediğimiz stringdeki numerik değer harici şeyler silebileceğiz
extension String{
    
    var digits: String{
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
}

