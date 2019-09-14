import UIKit

/* Protocols : Method (fonksiyon), property (özellikler) taslak olarak tanımlamanıza olanak sağlayan yapılara denir. Struct, Class, Enum gibi yapılara uygulanabilir. OOP Kavramının eksikliklerine çözüm getirmek için ortaya atılmıştır. POP (Protocol Oriented Programing) olarak da anılır */

//Sözleşme gibidir uyulması zorunludur.
//Class yapılarında 2 tane Miras alımı yoktur.
//Protocollerde birden fazla miras alma olayı vardır.

protocol Oyuncu{
    var isim:String {get}
    var canliMi:Bool { get set } //Hem can hem vurulabilir. Hem okumak hem işleme olduğu için getset
    var canSayisi:Int { get set }

}

extension Oyuncu{
    mutating func vurulma() {
        //Kişi vurulduysa
        if canSayisi > 0{ //Hala canı var mı?
            canSayisi -= 1
            if canSayisi == 0{
                canliMi = false //oyuncu öldü
            }else{
                canliMi = false //Zaten ölmüş
            }
        }
        let durum = canliMi ? String(repeating:"🧡",count:canSayisi) : "🔄"
        print("\(isim) : \(durum)")
    }
}

class SavasOyunu:Oyuncu{
    var isim: String
    var canliMi: Bool = true // Oyuna ilk başlayan kişi. Başlangıçta canlı
    var canSayisi: Int = 3 // 3 Can hakkı vardır
    
    init(isim:String) {
        self.isim = isim
    }
}

var GTA = SavasOyunu(isim: "Swift")
GTA.canSayisi
GTA.vurulma()
GTA.canSayisi
GTA.vurulma()
GTA.vurulma()


//Protocols ve Generics

//Örnek
func karsilastirInt(x:Int, y:Int) ->Bool {
    if (x<y) {
        print("İlk Sayı ikinci sayıdan küçüktür")
        return x < y
    }
    else{
        print("İlk Sayı ikinci sayıdan Büyüktür")
       return y < y
    }
}

karsilastirInt(x: 5, y: 4)

//Protocol yardımı ile < işlemini tanımlama

protocol Kucuktur{
    static func <(lhs: Self, rhs: Self)-> Bool
}

//Generics ile nasıl yapılır?

func karsilastir<T:Kucuktur>(x: T,y: T)->Bool{
    
    if (x<y) {
        print("İlk Sayı ikinci sayıdan küçüktür")
        return x < y
    }
    else{
        print("İlk Sayı ikinci sayıdan Büyüktür")
        return y < y
    } // Protocol tanımlamasaydık küçüktür değerini kullanamayacaktık
}

//
extension Int:Kucuktur{}
extension Double:Kucuktur{}

karsilastirInt(x: 5, y: 4) //extension yazarak Int değerlerini geçerli kıldık



