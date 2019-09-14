import UIKit

//Class ve Struct (Sınıf ve Yapılar) - Nesne Tabanlı Programlamanın Temeli - OOP
//Class Struct gibi yapıları isimlendirirken ilk harfi büyük yapılmalıdır

class Arac{
    var telerlekSayisi = 4
    var renk = "Kırmızı"
}

var bmw = Arac()
bmw.telerlekSayisi = 5
bmw.renk = "Siyah"

class Araba:Arac{
    //Miras alıyoruz yukardaki sınıftaki özellikleride bu sınıfa çağırdık - Inherit. Arac : Superclass ya da baseclass
    var model = 0
    var yakitTipi = "Benzinli"
}

var araba = Araba()
print("araba renk : \(araba.renk)")

let araba2 = araba

print("araba2 renk : \(araba2.renk)")

araba.model = 2019
araba.yakitTipi = "Tüplü"
araba.renk = "Beyaz"
araba.telerlekSayisi = 5

print("araba yeni renk: \(araba.renk)")
print("araba2 yeni remk : \(araba2.renk)")

//Referance Type -> örnek alınan nesneyi değiştirince değere referans alınan diğer değerlerde değişir araba2 de olduğu gibi

//Value Type -> String,Int,Dist,Enum,Struct = Değeri alıp kopyalar
var a = 5
var b = a
a = 6
print("a'nın son değeri:\(a)")
print("b'nin son değeri:\(b)")

//Miras olayı Struct yapısında yoktur.

class Aracim{
    var tekerlekSayisi:Int
    var renk:String
    
    //Başlangıç değeri vermemek için classdaki değerleri init'liyoruz
    init(tekerlekSayisi:Int,renk:String) {
        self.tekerlekSayisi = tekerlekSayisi
        self.renk = renk
    }
}

let merso = Aracim(tekerlekSayisi: 4, renk: "Kırmızı")
merso.renk
merso.tekerlekSayisi

//Struct'ta ise init kullanmak zorunlu değildir

struct Otomobil{
    var model:Int
    var yakitTipi:String
}

var otomobilim = Otomobil(model: 2019, yakitTipi: "Tüplü")
otomobilim.model
otomobilim.yakitTipi

var otomobilim2 = otomobilim
otomobilim.yakitTipi = "Dizel"
otomobilim.yakitTipi
otomobilim2.yakitTipi //Bunun yakıt tipi değişmedi Class'ta değişmişti

// Struct içinde ve Class içinde Fonksiyon Kullanılabilir

struct Kare{
    var kenarUzunlugu:Int
    func cevrehesapla()->Int{
        return kenarUzunlugu*4
    }
    func alanHesapla()->Int{
        return kenarUzunlugu*kenarUzunlugu
    }
}

let kenariUcOlanKare = Kare(kenarUzunlugu: 3)
kenariUcOlanKare.alanHesapla()
kenariUcOlanKare.cevrehesapla()



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



//// Miras olayı Struct yapısında yoktur
//// Subscript Class,Struct,Enum elemanlara daha rahat ulaşabilmek için kullanılır
//
//struct Aracimla{
//
//    var arabalar = ["Murat","Doğan","Şahin","Serçe","Kartal","BMW"]
//
//    func arabaSec(index:Int)->String{
//        return arabalar[index]
//    }
//}
//
//var arabam = Aracimla()
//arabam.arabaSec(index: 0)
//struct Arac2{
//
//    var arabalar2 = ["Murat","Doğan","Şahin","Serçe","Kartal","BMW"]
//    subscript(index:Int)->String{
//        return arabalar2[index]
//    }
//}
//
//var araba23 = Arac2()
//
//araba23[0]
//// [String:String]
//// [String:Int]
//
//class Sehirler{
//
//    var iller = ["Adana" : 1, "Adıyaman" : 2 , "Ankara" : 6, "İstanbul" : 34]
//    subscript(key:String) -> Int{
//
//        return iller[key]!
//    }
//}
//
//var sehirlerimm = Sehirler()
//
//sehirlerimm["Ankara"]
//sehirlerimm["İstanbul"]
