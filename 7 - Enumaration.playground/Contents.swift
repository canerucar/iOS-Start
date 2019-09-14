import UIKit

//Kısa haliyle enum ‘lar birbirleriyle mantıksal olarak alakalı değerleri bir arada gruplamamızı sağlayan yapılardır. Birbiri ile bağlı bu değerlere hem isimleriyle hemde bir index numarası ile erişebilmemiz mümkündür.

// Enumaration aynı tipteki benzer yapıları gruplamada kullanılır
// enum sözcüğü kullanılır
// Oyun yazılımcısı Hareket alanı tanımlayalım

enum HareketAlanı{
    case sag
    case sol
    case asagi
    case yukari
}

let solHareket = HareketAlanı.sol
let sagHareket = HareketAlanı.sag
var yerindeSay = HareketAlanı.sol

yerindeSay = .sag //Daha önce hareketAlanı ile ilişkisi olduğunu belirttik o yüzden tekrarlamaya gerek yok

enum Sayilar:Int{
    case Bir = 1, iki, Uc, Dort, Bes //Otomatik, sayısal olarak değerlerini atar
}

let bes = Sayilar.Bes
print(bes.rawValue) //bes'in sayısal karşılığını aldık

enum Hata:Error{
    case sunucuHatasi(sebep:String)
    case kullaniciHatasi(sebep:String)
}

let hata = Hata.kullaniciHatasi(sebep: "Kullanıcı hatalıdır")
print(hata)
enum Sehirlerimizden:String{
    case Ankara = "Başkenttir"
    case Adana = "Bici bici talısı ile meşhurdur"
}

let sehir  = Sehirlerimizden.Adana
print(sehir.rawValue)

//------------------------------------------------

enum Gunler{
    case pazartesi
    case sali
    case carsamba
    case persembe
    case cuma
    case cumartesi
    case pazar
    
    //yada
    //case pazartesi, sali, carsamba, persembe, cuma, cumartesi, pazar
}

var bugun = Gunler.cuma
bugun = .cumartesi
var yarin : Gunler = .cumartesi

print(bugun)
print(yarin)

//Switch Case ile Enumeration Değerlerini Birlikte Kullanma

switch bugun {
case .pazartesi:
    print("Haftanın ilk günü")
case .sali:
    print("Bugün Salı")
case .carsamba:
    print("Bugün Çarşamba")
case.persembe:
    print("Bugün Perşembe")
case .cuma:
    print("Bugün Cuma")
case .cumartesi:
    print("Bugün Cumartesi")
case.pazar:
    print("Bugün Pazar")
}


//Swift dilinde enum değerlerini özel tiplerde değerler tutmak içinde kullanabilmekteyiz. Mesela kullanıcı uygulamamıza giriş yapabilmek için iki seçenekten birini kullanmak durumunda olsun buna uygun enum yapısını yazalım,

enum girisSekli{
    
    case adSoyad(String,String)
    case tcKimlikNo(Int)
}

var kullaniciGirisSekli = girisSekli.adSoyad("Caner", "Uçar")
kullaniciGirisSekli = .tcKimlikNo(32994054395)

print(kullaniciGirisSekli)
