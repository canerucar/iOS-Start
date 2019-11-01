//: Playground - noun: a place where people can play

import UIKit

// == eşittir
// < küçüktür
// > büyüktür
// <= küçük eşit
// >= büyük eşit
// != eşit değil
// || veya
// && ve

var myAge = 50

if myAge < 30{ //eğer yaş 30dan küçükse
    print("Gençsin")
}
else if myAge > 30 && myAge < 40{  //yaş 30 ile 40 arasındaysa
    print("Otuzlarındasın")
}
else{
    print("40'ı devirmişsin") // iki değeride sağlamıyorsa zaten 40 yaş üstü olacağı için
}

var myName = "James"
if myName == "James"{
    print("ismin James")
}

// Kpss test uyguylamasında daha fazla test için para ödenen uygulama
var isPaid:Bool = false
isPaid = true
let a = 5
if a == 5 {
    print("Ödemeniz başarıyla alındı, içeriği görebilirsiniz")
}
else{
    print("Ödeme yapılmadığından içeriği göremezsiniz")
}


var userName = "canerucar"
var password = 123456
if(userName == "canerucar" || password == 123456){
    
    print("Kullanıcı Girişi Başarılı")
    
} else if userName == "kerimcaglar2" {
    print("Şifre alanını boş geçmeyin")
}
    
else{
    print("Girilen bilgiler yanlıştır")
}

// && ve operatörü: Tüm koşulların sağlanması gerekir
// || veya operatörü ise en az birinin sağlanması yeterlidir
//Ternary (Üçlü) ifade

var testing:String? //Nil'e eşit değilse true dön eşitse false dön
var aaa = testing != nil ? true : false // 3 lü if ternary if
print(aaa)


var isim = "caner"
var ifim = isim != "caner" ? "Değeriniz yanlış" : "değer doğru"



//
func loveCalculator(yourName:String,theirName:String)->UInt32{
    let loveScore = arc4random_uniform(101)
    
    if loveScore>80 {
        print("Puanınız : \(loveScore) Evlenin")
    }else if loveScore > 60 && 80 < loveScore{
        print("Puanınız : \(loveScore) İdare ediyonuz işte.")
    }else{
        print("Puanınız : \(loveScore) Neyse bir şey demek istemiyorum")
    }
    
    return loveScore
}


let myScore = loveCalculator(yourName: "Ali", theirName: "Fatma")
//print("Love Skorum : \(myScore)")

