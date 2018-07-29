//: Playground - noun: a place where people can play

import UIKit

var myAge = 50

if myAge < 30 //eğer yaş 30dan küçükse
{
    print("Gençsin")
}
else if myAge > 30 && myAge < 40  //yaş 30 ile 40 arasındaysa
{
    print("Otuzlarındasın")
}
else
{
    print("40'ı devirmişsin") // iki değeride sağlamıyorsa zaten 40 yaş üstü olacağı için
}

var myName = "James"

if myName == "James"
{
    print("ismin James")
}

// == eşittir
// < küçüktür
// > büyüktür
// <= küçük eşit
// >= büyük eşit
// != eşit değil
// || veya
// && ve
