import UIKit

// Closures - Kapatmalar
// C - Objective-c Blocks
// Diğer dillerdeki lampda
//Fonksiyonlara benzer

let sehirlerden = ["Adana","Adıyaman","Ankara","Denizli","Bursa","Eskişehir","Çanakkale"]

func sirala(s1:String,s2:String)->Bool{
    return s1 < s2
}
//Sortedd = Sıralama işlemi yapar. by = neye göre sırala?
var yenidenSirala = sehirlerden.sorted(by:sirala)
//print(yenidenSirala)
/*Closure nasıl tanımlanır
{ (parameters)-> Dönüş tipi in
    kodlarımız
}
 by dan sonraki kısım Closure olarak görebiliriz
*/
//Closure en uzun hali
yenidenSirala = sehirlerden.sorted(by:{(s1:String, s2:String)->Bool in return s1 < s2})

// Daha iyi hali Değişken tipini ve dönüş değerini Swift anlar
yenidenSirala = sehirlerden.sorted(by:{s1,s2 in return s1 < s2})

// Daha da iyi olan versiyon
yenidenSirala = sehirlerden.sorted(by:{s1,s2 in s1 < s2})

// Daha da iyi olan versiyon   birinci elemanla < ikinci elemanı sırala
yenidenSirala = sehirlerden.sorted(by:{$0 < $1})

// Operatör Method
yenidenSirala = sehirlerden.sorted(by: <)

print(yenidenSirala)
