import UIKit

//Subscript Class, Struct, Enum elemanlara daha rahat ulaşabilmek için kullanılır

struct Arac{
    var arabalar = ["BMW","SKODA","MERS"]
    
    func arabaSec(index:Int) -> String {
        return arabalar[index]
    }
}

var araba = Arac()
araba.arabaSec(index: 0)

struct Arac2{
    var arabalar = ["BMW","SKODA","MERS"]
    
    subscript (index:Int) -> String {
        return arabalar[index]
    }
}

var araba2 = Arac2()
araba2[0]

//[String:String]
//[String:Int]

class sehirler{
    var iller = ["Ankara":06,"Samsun":55]
    subscript(key:String)->Int{
        return iller[key]!
    }
}
var sehir = sehirler()
sehir["Samsun"]
