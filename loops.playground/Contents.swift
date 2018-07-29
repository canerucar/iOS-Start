//: Playground - noun: a place where people can play

import UIKit

var number = 1

//while loop

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
