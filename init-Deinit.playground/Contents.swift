import UIKit

//Initialization, class ‘tan, enum ‘dan veya struct ‘dan bir instance oluşturacağımız zaman hazırlanma işlemidir. Bu işlem depolanmış olan her özellik için bir başlangıç değeri ayarlamayı ve kullanıma hazır olmadan önce gerekli işlemlerin yapılmasını sağlar.


struct Derece{
    
    var sicaklik: Double
    init() {
        sicaklik = 17.0
    }
    
    //ya da;
    //var sicaklik: Double = 17.0
    
}

var dereceInstance = Derece()

print("Default Sıcaklık Değeri: \(dereceInstance)")

struct DereceDonustur{
    
    var sicaklikDerce: Double
    init(fahrenheittandereceye fahrenheit: Double) {
        sicaklikDerce = (fahrenheit - 32.0) / 1.8
    }
    
}

let fahrenheitVerDereceAl = DereceDonustur(fahrenheittandereceye: 152.0)
print(fahrenheitVerDereceAl.sicaklikDerce)

//Deinitialization
//
//Bir sınıf nesnesi Otomatik Referans Sayacı (ORS) mekanizması tarafından heap ’ten yok edilmeden hemen önce o nesne için o sınıfın deinit metodu çağrılır. deinit metodunun parametresi ve geri dönüş değeri yoktur. Bir başka deyişle, objemiz deallocate edilmeden önce işlemler yapmak  için deinit metodunu kullanabiliriz. Deinit metodu objemiz deallocate edilmeden önce çalışır. Hemen genel tanımlaması nasılmış görelim,


class OrnekSinif{
    
    var a: Int
    init() {
        a = 0
        print("Örnek init")
    }
    init(a:Int) {
        self.a = a
        print("Örnek init")
    }
    deinit {
        print("Örnek Deinit")
    }
}
var sinifInstance: OrnekSinif? = OrnekSinif()
print("Init Deneme")
sinifInstance = nil
print("Deinit deneme")
