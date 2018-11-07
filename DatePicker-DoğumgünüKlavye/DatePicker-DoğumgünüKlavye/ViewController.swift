//
//  ViewController.swift
//  DatePicker-DoğumgünüKlavye
//
//  Created by Caner Uçar on 6.11.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let birtdayPicker = UIDatePicker() //instance yaratalım
    
    @IBOutlet weak var birthdayTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBirthdayPicker()
        
    }
    
    
    func setBirthdayPicker()
    {
        //birthdayTF nin inputunun bir DatePicker olduğunu söyledik.
        birthdayTF.inputView = birtdayPicker
        //Timezone u Türkiye olarak ayarladık.
        birtdayPicker.timeZone = NSTimeZone.local
        birtdayPicker.datePickerMode = UIDatePicker.Mode.date
        birtdayPicker.locale = Locale(identifier: "tr_TR")
        //Arkaplan rengi, gölge gibi göze hoş gelecek kullanıcı deneyimi ayarları yaptık.
        birtdayPicker.backgroundColor = UIColor.white
        birtdayPicker.layer.cornerRadius = 5.0
        birtdayPicker.layer.shadowOpacity = 0.5
        birtdayPicker.addTarget(self, action: #selector(onDidChangeDate), for: .valueChanged)
    }
    
    @objc func onDidChangeDate(sender:UIDatePicker) {
        //DateFormatter yarattık ve tarihi gün/ay/yıl olarak formatlayacağımızı söyledik
        //birthdayTF nin içerisine kullanıcıdan gelen inputu yazdırdık
        let myDateFornatter: DateFormatter = DateFormatter()
        myDateFornatter.dateFormat = "dd/MM/yyyy"
        let mySelectedDate = myDateFornatter.string(from: sender.date)
        birthdayTF.text = mySelectedDate
    }
    
    //kalvyeyi ekrana dokunmaya hassas hale getirdik
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

