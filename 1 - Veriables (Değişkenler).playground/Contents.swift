//: Playground - noun: a place where people can play

import UIKit

/*Burada ne olması gerekiyor
 Int,String,Double,Float,Tuples,Optional
 */

// 'var' değiştirilebilen bir sabit
// 'let' değiştirilemeyen sabit

//bu bir string'dir
var name = "jesse" //var değişkenini kullanıp name'i tanımlayıp Jesse ismini verdik

name.append("e") //append kelimenin sonuna bir harf daha eklemek için kullandık
name.capitalized //kelimenin baş harfini büyük yapar
name.lowercased() //bütün harfleri küçültür
name.uppercased() //bütün harfleri büyültür

name //burada verdiğimiz ismi görmek için değişkeb ismini yazdık
name = "Walter" //ismi burada değiştirip

name //burada tekrar yazdığımız da değiştirdiğimiz isim gözükmektedir

let lastname = "Pinkman"

lastname //burada değiştirmeye çalışırsak hata alırız. Çünkü let değiştirilemez
lastname.count //karakter sayısını buluyoruz

//integer & double
var sayi = 10 //Sabit bir değer atadık
sayi + 10 * 2 //sayıya çeşitli matematik işlemleri yaptırdık
var pi = 3.14 //Ondalıklı sayı - Double
sayi + Int(pi) //double ile int değişkenini toplamak için birini ya double ya da int'e çevirmemiz gerekiyor.

var myBoolen = true //Bool değişkeni true ve false'tur. aklınıza gelebilecek heryerde kullanılabilir
myBoolen = false

//önceden tanımlama
var number : Int = 30 //Sayının kesin olarak integer olduğunu ve değeri 30 olduğunu belirttik
number
var text : String = "" //Aynı şekilde bir string olarak kesinlik bildirdik


var cumle = """
Türkçe
Swift
Programlama
"""
print(cumle)

//Boolean - True & False (En iyi if else ile kullanılır)

var isPaid:Bool = false
isPaid = true

if isPaid {
    print("Ödendi")
}else{
    print("Ödenmedi")
}

//Tuples
let tuples = (4,"Swift") //İlk değişken integer ikincisi String
print(tuples) //tuple'ın ilk değerini gördük
let (statusCode, status) = tuples //Değerleri atadık
print(statusCode)
print(status)

//Optionals

var x : String? //? nil değer sonradan doldurabilirim - nil anlamlı bir değer değildir
print(x ?? "Boş")
//print(x!)       - Optionalden kurtulmak için 1
//print(x as Any) - Optionalden kurtulmak için 2
//print(x ?? "Geçersiz Değer") - Optionalden kurtulmak için 3









