import UIKit

// Error handling - Hata Yakalama

var ekran = "0.0"

enum HesaplamaHatalari:Error{ //Error protokolünü kullanıyoruz
    case nanHatasi // nan : Tanımsız, tanımlanamayan hata
    case InfHatasi //inf : Sonsuz
}

//hata fırlatmasını istiyorsak throws ekliyoruz. throws : Fırlatmak
func bolme(bolunen:Double, bolen:Double) throws->Double{
    guard bolunen != 0 else {
        print("Tanımsız Değer")
        throw HesaplamaHatalari.nanHatasi
    }
    
    guard bolen != 0 else {
        print("Inf Hatası")
        throw HesaplamaHatalari.InfHatasi
    }
    return bolunen/bolen
}

//Hatayı throws ile fırlattık burada da yakalama işlemini yapacağız
do {
    try bolme(bolunen: 0, bolen: 0)
} catch HesaplamaHatalari.InfHatasi {
    ekran = "HATA"
} catch HesaplamaHatalari.nanHatasi{
    ekran = "Tanımsız"
}

//not 100 den büyük olamaz
//not negatif olamaz
//bolme(bolunen: 1, bolen: 0) // Inf hatası alınır
//bolme(bolunen: 0, bolen: 0) // nan hatası alırız

