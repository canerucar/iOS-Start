import UIKit

/*Lazy Stored Properties
 Lazy yani tembel stored propertyler, ilk değerleri kullanacakları an gelene kadar başlangıç değeri
 hesaplanamayan property'lerdir. Tanımlamak için başlarına lazy keyword'ü yazılarak tanımlanırlar.
 Bunun sebebi ise constant değerler initialization işlemlerinden önce her zaman bir değere sahip
 olmak zorundadırlar bu durum da lazy olarak tanımlanmalarına engeldir.
 
 */

struct KullaniciBilgileri{
    var isim:String
    var yas :Int
    
    init(isim:String,yas:Int) {
        print("initalize")
        self.isim = isim
        self.yas = yas
    }
}

/*Kullanici adında bir başka struct ‘ımızı oluşturduk. Ve bu struct ‘ımız içerisinde KullaniciBilgileri struct ‘ımıza ait bir instance oluşturduk. Bu instance ‘ımız lazy olarak tanımlanmamıştır.*/

struct Kullanici{
    //var birinciKullanici = KullaniciBilgileri(isim: "Caner", yas: 22)
    lazy var ikinciKullanici = KullaniciBilgileri(isim: "Caner", yas: 22)
}

/*Burada ise Kullanıcı struct ‘ımızın instance ‘ını oluşturduk. Önemli olan nokta birinciKullanici instance ‘ımızı çağırmamış olmamız. Buna rağmen konsolda init methodumuzda yazdığımız “initalize” yazısını konsolda görmüş olmamızdır. Buda init methodunun çağrıldığını göstermektedir. Şimdi ise lazy kullanmanın farkını görmek için Kullanici struct ‘ımıza ikinci bir instance ekleyelim,*/

var kullanici = Kullanici()
