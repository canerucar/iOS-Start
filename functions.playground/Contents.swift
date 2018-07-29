//: Playground - noun: a place where people can play

import UIKit

//fonksiyon tanımlıyoruz aynı bir sınıf gibi
func myFunction()
{
    print("Hello World")
}

myFunction() //sonra bu fonksiyonu buraya çağırıyoruz

func sumFunc(x: Int, y: Int) -> Int //burada tanımlanan, parantez içindeki kullanıcıdan alınan, ok ile gösterilen çıktı alacağımız sonuç
{
    return x+y //çıktı olarak bize toplama işlemini yaptırdık
}
sumFunc(x: 10, y: 5) //iki sayıyı topladı
sumFunc(x: -10, y: -5)

func myLogic(x:Int, y:Int) ->Bool 
{
    if x > y
    {
        return true
    }
    else
    {
        return false
    }
}

myLogic(x: 1, y: 5)
