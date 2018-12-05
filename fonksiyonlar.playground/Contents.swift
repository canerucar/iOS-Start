import UIKit

func hesapla(Yapılacakİşlem islem:String, BirinciSayı sayi1:Int, İkinciSayı sayi2:Int){
    
    switch islem {
    case "topla":
        print(sayi1+sayi2)
    case "çıkarma":
        print(sayi1-sayi2)
    case "ortalama":
        print((sayi1+sayi2) / 2)
    default:
        print("Hatalı KOD")
    }
    
}

hesapla(Yapılacakİşlem: "ortalama", BirinciSayı: 10, İkinciSayı: 5)


func adSoyad(ad: String, soyad: String = "Belirtilmemiş"){
    
    print("Adı: ",ad)
    print("Soyadı: ",soyad)
    
}

adSoyad(ad: "Caner")

func selamlam(isim:String) ->String{
    
    return "Merhaba, benim adım\(isim)"
}

selamlam(isim : "Caner")


func maksimumVeMinimumBul(dizi: [Int]) -> (enKucuk: Int, enBuyuk: Int) {
    var suankiMin = dizi[0]
    var suankiMax = dizi[0]
    for deger in dizi[1..<dizi.count] {
        if deger < suankiMin {
            suankiMin = deger
        } else if deger > suankiMax {
            suankiMax = deger
        }
    }
    return (suankiMin, suankiMax)
}

let degerler = maksimumVeMinimumBul(dizi: [10,56,20,30])

print("En büyük değer: \(degerler.enBuyuk), En küçük değer: \(degerler.enKucuk)")


func sayiTopla(_ sayi1: Int,_ sayi2: Int) -> Int{
    
    
    return sayi1 + sayi2
}

sayiTopla(5, 10)

enum Siniflar{
    
    case okulyok
    case ilkokul
    case ortaokul
    case lise
    case mezun
    
}

class Ogrenci{
    
    var id   : Int
    var name : String
    var age  : Int
    
    init(id:Int, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
    
    func getSinif() ->Siniflar{
        
        if age > 5 && age < 10{
            return .ilkokul
        }
        else if age > 10 && age < 14{
            return .ortaokul
        }
        else if age > 14 && age < 18{
            return .lise
        }
        else if age < 5{
            return .okulyok
        }
        else{
            return .mezun
        }
        
    }
}

let ogrenci1 = Ogrenci(id: 10, name: "Caner", age: 15)


print("İlk Öğrenci : \(ogrenci1.id)")
print("Sınıf: \(ogrenci1.getSinif())")


func yazBakalim(){
    
    print("Hello Türkiyem")
    
}

print(yazBakalim())



struct dikdort{
    
    var genislik:Double
    var uzunluk :Double
    
    init(g:Double,u:Double) {
        genislik=g
        uzunluk=u
    }
    
    func alan() -> Double {
        return genislik * uzunluk
    }
    
    func cevre() -> Double {
        return 2*(genislik+uzunluk)
    }
    
}

var d = dikdort(g: 5, u: 10)

print("Dikdörtgen Genişliği: \(d.genislik)")


