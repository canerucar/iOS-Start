//: Playground - noun: a place where people can play

import UIKit

//Diziler ve Sözlük Yapısı (Array ve Dictionary)
//Tuple'dan farklı tek tipli değerle alır diziler

var strx = [String]() //Boş ve elemanları string olan bir dizi
var tamsayi = [Int]() //Boş ve elemanları integer olan bir dizi
var OndalikliSayi = [Double]()

//append -> diziye eleman ekler
strx.append("Swift") //Diziye eleman ekledik
strx.append("3")    //Diziye eleman ekledik
strx.remove(at: 1)  //1.indisi sil
strx.removeAll()    //Tüm elemanları sil
strx                //Son halini bastırdık

//Swift 4 ile geldi
var kelimes = ["kelime1","kelime3","kelime2"]
kelimes.swapAt(1,2) //ilk indisle 2.indisi değiştiriyoruz
kelimes //Son halini bastırdık

//Tek taraflı sınır değeri koyma Swift 4 ile geldi
var sehirler = ["Adana","Adıyaman","Bursa","Çanakkale","Denizli"]
let ilkSehirler = sehirler[..<2] //İndisi 2den küçük elemanları yazdır
let sonSehirler = sehirler[2...] //İndisi 2den büyük elemanları yazdır
sehirler.count // Eleman sayısı bulunur

sehirler.count //Eleman sayısını bulabiliyoruz

//Dictionary

//Dictionary kelime:anlamı -> key:value

var kullaniciBilgileri = ["Adı":"Caner","Soyadı":"Uçar","Meslek":"iOS Developer"]
kullaniciBilgileri.count
kullaniciBilgileri.updateValue("Battal", forKey: "Soyadı") //Soyadı keyinin değerini değiştirdik
kullaniciBilgileri

//Swift 4 ile geldi

let yenidenDuzenleSehirler = ["Adana":"0","Adıyaman":"1","Bursa":"2","Çanakkale":"4", "Denizli":"5"]
let sonDurum = Dictionary(grouping:yenidenDuzenleSehirler.keys) {$0.first!} //Keylerin ilk harflerini alarak grupla
let sayiyaGore = Dictionary(grouping:yenidenDuzenleSehirler.keys) {$0.count}
sonDurum
sayiyaGore


print("--------")


var favoriteMovie = ["pulp fiction","Lost in Space","Better Call Saul"] //diziye string değerler atadık

favoriteMovie[0] // dizinin ilk değeri
favoriteMovie.count //dizinin uzunluğu
favoriteMovie.isEmpty //boş mu dolu mu kontrol
favoriteMovie.append("Breaking Bad") //Diziye yeni bir değer atadık
favoriteMovie
favoriteMovie.sort() //Sıralama

var favoriteNumbers = [1,5,7,9] //Sayı bir değerde atabiliriz

//dictionaries

var myFavoriteDirectors = ["Pulp Fiction" : "Quentin Tarantino", "Lock,Stock" : "Guy Ritchie", "The Dark Knight ": "Christopher Nolan"]

myFavoriteDirectors["Pulp Fiction"]
myFavoriteDirectors["Lock, Stock"] = "Mr. Ritchie"

myFavoriteDirectors.dropFirst() //ilk elemanı kaldır
myFavoriteDirectors.dropLast() //son elemanı kaldır


