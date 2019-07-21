//: Playground - noun: a place where people can play

import UIKit

var myName : String? //? string olabilirde olmayabilirde

myName?.uppercased()

// Optionals : ? v !

var myAge = "5" //ama kullanıcı yazıyla da beş yazabilir

var myResult = Int(myAge)! * 5 //ünlem işareti, eminim demektir ama riskli

if let number = Int(myAge) //ünlem kullanmaktansa if let kullanıp bir filtre uygulamak daha sağlıklı
{
    let result = number * 5
    print(result)
}

var xd:String? = "Swift"

//İlk değer olarak bizden kesin birşey istiyor.

//İster boş değer verin, isterseniz dolu verin ama değer verin

print(xd ?? "Geçersiz Değer")

//Opsiyonel Bağlama (Optional Binding)

var baglamaDegiskeni: String?

let atananSabit = baglamaDegiskeni

print("Opsiyonel Değil = \(atananSabit)")
print("Opsiyonel = \(baglamaDegiskeni)")

