//
//  ViewController.swift
//  CoreDataVeriTabani
//
//  Created by Caner Uçar on 21.09.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //CoreData Kullanımı
        //AppDelegate'in bir örneğini alıyoruz
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //Yeni bir veri atamak için
        let users = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        //Veri tabanınına veri gönderiyoruz
        users.setValue("CanerU", forKey: "name")
        users.setValue("12345", forKey: "password")
        users.setValue(22, forKey: "age")
        users.setValue("canerucar00@gmail.com", forKey: "email")
        
        //Hata ayıklama
        do {
            try context.save() //Veriyi kaydediyoruz
            print("Kaydedildi")
        } catch  {
            print("Bir hata oluştu")
        }
        
        //Veri çekme
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        //Sadece bu veri ile ilgili işlem
        request.predicate = NSPredicate(format: "email=%@", "canerucar00@gmail.com")
        
        do {
            let users = try context.fetch(request)
            if users.count>0{
                for user in users as! [NSManagedObject]{
                    
                    //Veri silme
                    context.delete(user)
                    
                    do{
                        try context.save()
                    }catch{
                        print("Silme işlemi başarılı bir şekilde tamamlandı")
                    }
                    
                    if let name = user.value(forKey: "email") as? String {
                        print(name)
                    }
                }
            }else{
                print("....")
            }
            
        } catch  {
            print("Veri Çekmede hata oluştu")
        }
    }


}

