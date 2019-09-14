//: Playground - noun: a place where people can play

import UIKit

// For Döngüsünün Array ile kullanımı

var sehirlerim = ["Ankara","Eskşehir","İstanbul","İzmir","Bursa"]
for sehir in sehirlerim{
    print(sehir)
}

// For döngüsünğn Stringler için kullanımı
// Swift 4 ile geldi Swift 2 de vardı 3 de kaldırılmıştı

var strim = "Merhaba Dünya"
for s in strim{
    print(s)
}

//For döngüsünün Dictionary için kullanımı
var arabalar = ["Bmw":"0", "Mercedes":"1", "Ford":"2"]
for (key,value) in arabalar{
    print("\(key) : \(value)")
}

//while loop
var number = 1
while number < 15 // number sayısı 15'den küçükse
{
    number = number + 1 //numberı 1 arttırıp tekrar numbera ata
    print(number) //arttırılmış olarak değerleri buraya yazar
}

var myCharacterAlive = true //karakter oluşturup hayatta olduğunu belirttik

while myCharacterAlive == true //karakter yaşıyor true
{
    print("character is alive") //yaşadığı için ekrana bunu bas
    myCharacterAlive = false //sonra durdur
}

//for loop
//genelde diziler ile kullanıldığı için dizi örneği yapalım

var myArray = ["elma","armut","portakal"]

for fruit in myArray //fruit bir obje, arraydaki her elemanı temsil ediyor
{
    print(fruit) //örneğin burada tüm meyveleri yazdırdık
}
//bir diğer örnek

var myNumberArray = [1,2,3,4,5]

for number in myNumberArray
{
    print(number + 1) //sayıları birer arttırarak bastık
}
//diğer örnek

var max = 10

for number in 1 ... max
{
    print(number)
}

//Switch - case yapısı
//Not aralığına göre harf notu verme örneği
//90 - 100 :AA 80-89:BA 70-79:BB 60-69:CB 50-59:CC 40-49:DD 0-39:FF
//önce if - else ile yapalım

var not = -20
if not >= 0 && not <= 39{
    print("FF")
} else if not >= 40 && not <= 49{
    print("DD")
} else if not >= 50 && not <= 59{
    print("CC")
}else if not >= 60 && not <= 69{
    print("CB")
}else if not >= 70 && not <= 79{
    print("BB")
}else if not >= 80 && not <= 89{
    print("BA")
} else if not >= 90 && not <= 100{
    print("AA")
} else{
    print("Girilen not değeri geçerli değildir")
}

//Switch Case

switch not {
case 0...39:
    print("FF")
case 40...49:
    print("DD")
case 50...59:
    print("CC")
case 60...69:
    print("CB")
case 70...79:
    print("BB")
case 80...89:
    print("BA")
case 90...100:
    print("AA")
default:
    print("Girilen not değeri geçerli değildir")
}

// For in ile Switch case kullanımı

var sehirleriz = ["Adana","Ankara","İzmir","İstanbul"]
for sehir in sehirleriz{
    switch sehir {
    case "Adana":
        print("Adliyesi ile meşhurdur")
    case "Ankara":
        print("Başkenttir")
    case "İzmir":
        print("Egenin incisi")
    case "İstanbul":
        print("Gezilebilecek en iyi şehir")
    default:
        print("Geçerli bir şehir ismi girilmedi")
    }
}
