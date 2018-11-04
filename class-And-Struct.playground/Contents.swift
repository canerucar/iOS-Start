import UIKit

class Macbook{
    
    var year: Int
    var color: String
    
    init(year: Int, color: String) {
        
        self.year = year
        self.color = color
    }
}

let myMacbook = Macbook(year: 2014, color: "Space Grey")
print(myMacbook.year)
let stolenMacbook = myMacbook

stolenMacbook.color = "Spraypaintad Green"
print(myMacbook.color)


struct iPhone{
    
    var number: Int
    var color: String
}

let myiPhone = iPhone(number: 7, color: "Black")
var stoleniPhone = myiPhone

stoleniPhone.color = "Rose Gold"
print(stoleniPhone)
