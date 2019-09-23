import UIKit
/*anonim fonksiyonlar,değişkenlerde saklanabilen, fonksiyonlara parametre olarak verilebilen özel kod blokları
Closures - Kapatmalar
C - Objective-c Blocks
Diğer dillerdeki ismi lampda
Fonksiyonlara benzer*/


/*Önce fonksiyonda nasıl yazılıyor ona bakalım*/
func birlestir(param1:String,param2:String)-> String {
  return "\(param1) \( param2)"
}
print(birlestir(param1: "Closure'lar",param2: " Swift için Önemlidir")) // Closure'lar Swift için Önemlidir

/*Üstteki fonksiyonu closure yapısına dönüştürülmüş hali*/
var birlestirClosure = {(param1:String,param2:String)-> String in
    return "\(param1) \(param2)"
}
print(birlestir(param1: "hi, i am a",param2: " Closure!!")) // hi, i am a Closure!!

/*Clouser Formları - Parametre almayabilir, geri değer döndürmeyebilir.*/
var paremetreYokDonusYok:()->() = { ()-> Void in
    print("Ben bir hiçim :)")
}// Hiç bir parametre almayacak ve hiçbirşey döndürmeyecek.

//Bu durumda çok daha kısa şekilde yazabiliriz. - Parametre isimleri belirtmediği için “in” ifadesini kaldırdık.
var paremetreYokDonusYok2 = {print("Hala öyleylim :):) ")}

/*Parametre alıp geriye birşey döndürmeyebilir*/
var parametreVarDonusYok: (String,String) ->() = { (param3,param4)-> Void in
   print("\(param3) \(param4) ")
}

//Parametrelerin ifade biçimi
var parametreVarDonusYok2: (String,String) ->() = {
    print("\($0) \($1)")
}
parametreVarDonusYok("Gittikçe güzelleşiyor"," değil mi?") // Gittikçe güzelleşiyor, değil mi?

/*İkinci clouser yapısında parametleri, dönüş tipini ve in keywordünü kaldırdık. Daha az kodla, ilkiyle tamamen aynı işlevi görür hale getirdik. Farklı olarak $0,$1 ifadelerini kullandık. Closure kullanırken parametreleri isimlerden arındırabilir, yerlerine $0(ilk parametre), için $1(ikinci parametre) varsa devamı için $2, $3… şeklinde kullanabiliyoruz.
 
 
 
 Parametre alıp geriye değer döndürebilir */

var topla: (Int,Int) -> (Int) = {(s1,s2) -> Int in
    return s1+s2
}
topla(14,2) // 16

// Çok daha kısa hali
var topla2:(Int,Int)->Int =  {return $0+$1} // topla(2,5) // 7

// return de olmadan işlemi yapabiliyoruz.
var topla3:(Int,Int)->Int =  {$0+$1}
topla3(5,4) // 9

/*örnek*/
var array:[Int] = [1,4,5,2,8,6,12,19]
var modAl = array.filter{$0%3 == 0}
print(modAl) // [6, 12]

var besEkle = array.map{$0+5}
print(besEkle) // [6, 9, 10, 7, 13, 11, 17, 24]

//Arrayin tüm değerlerini string olarak yazdıralım.
print(array.map{"\($0)"}) // ["1", "4", "5", "2", "8", "6", "12", "19"]

// Elamanları ikiyle çarp sekizden küçün olanları getir, küçükten büyüğe sırala.
var islemler = (array.map {$0 * 2}.filter{$0<8}.sorted{$0 < $1})
print(islemler) // [2, 4]



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
