//
//  MoneyModel.swift
//  MVC-Basic
//
//  Created by Caner Uçar on 19.12.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import Foundation

class Money{
    
    var selling : Double
    var update_date : Date
    var buying : Double
    var full_name : String
    var code : String
    var guncelleme = 1499284066
    
    var sellingString:String{
        return String(selling)
    }
    
    var buyingString:String{
        return String(buying)
    }
    
    var dateString:String{
        let date = Date(timeIntervalSince1970: TimeInterval(guncelleme))
        return String(describing: date)
    }
    
    
    init(selling:Double,update_date:Date,buying:Double,full_name:String,code:String) {
        self.selling = selling
        self.update_date = update_date
        self.buying = buying
        self.full_name = full_name
        self.code = code
    }
    
    init() {
        self.selling = 5.25
        self.update_date = Date(timeInterval: TimeInterval(guncelleme), since: Date())
        self.buying = 5.15
        self.full_name = "Amerikan Doları"
        self.code = "USD"
    }
    
}
