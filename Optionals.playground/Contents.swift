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
