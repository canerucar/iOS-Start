import UIKit

/*Property Observers
Türkçe karşılığı özellik gözlemleyicileridir. Property ‘lerin değerini sürekli gözlemler ve gözlemlediği değer değiştiği anda tetiklenirler yani çalışırlar. 2 adet property observers bulunmaktadır.
 willset : Değer kaydedilmeden hemen önce çalışırlar.
 didset : Yeni değer kaydedildikten hemen sonra çalışırlar.
 */

class AdimSayar{
    var toplamAdim: Int = 0{
        willSet(yeniToplamAdim){
            print("Toplam Adım sayısı \(yeniToplamAdim) olacak")
        }
        didSet{
            if toplamAdim > oldValue{
                print("Eklenen adım sayısı \(toplamAdim - oldValue)")
            }
        }
    }
}

/*AdimSayar isimli class ‘ımızı oluşturduk. Bu class ‘ımızda bir adet property ‘imiz mevcut. willSet observer ‘ımızın yanına bir değişkenimiz mevcut bu değişkenin ismini biz kendimiz belirliyoruz. Bu değişkenin değeri toplamAdim değişkeninin değeri değiştirilirken gelen yeni gelen değer olacaktır. didSet observer ‘ımızda ise böyle bir değişken bulunmamaktadır. Bunun yerine oldValue isimli bir değişkenimiz mevcuttur yeni bir parametre vermez isek default olarak oldValue isimli parametreyide yukarıdaki gibi kullanabilmekteyiz. didSet observer ‘ımız toplamAdim property ‘sinin değeri değiştirildikten sonra çalışmaktadır. Burada yaptığımız işlem ise toplamAdim sayısının  ne kadar olacağını görmek ve her seferinde adim sayisinin ne kadar arttığını görmektir. willSet observer ‘ımızda ise bu default parametremizin adı newValue ‘dur.*/

let adimSayar = AdimSayar()
adimSayar.toplamAdim = 100

/*
 adimSayar instance ‘ımızın toplamAdim property’sini 100 olarak belirledik. toplamAdim ‘nın değeri değişmeden önce willSet observer ‘ımız çalışacaktır. Böylelikle ekrana “Toplam adım sayısı 100 olacak” yazısını bastıracaktır. toplamAdim property ‘sinin değeri değiştikten sonra ise didSet observer ‘ımız çalışacaktır ve ekrana “Eklenen adım sayısı 100” yazısını bastıracaktır. toplamAdim property ‘sinden default parametre olarak kullandığımız oldValue değerini çıkartarak aradaki farkı bulmaktayız. oldValue değerimiz her zaman bir önceki toplamAdim değerimiz olacaktır. Özet olarak willSet değer değiştirilmeden önce çalıştırılır ve olacak değeri newValue ile görebiliriz. didSet ise değer değiştikten sonra çalıştırılır ve önceki değeri oldValue ile görebiliriz. Şimdi sizde
 */

adimSayar.toplamAdim = 200

