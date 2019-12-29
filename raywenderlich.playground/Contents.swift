import UIKit

//Parametrelerin başına alttire koyduğumuzda fonksiyonu çağırma işleminde firstname ya da lastname gözükmüyor
func fullName(_ firstName:String,_ lastName:String){
    print(firstName + " " + lastName)
}

//fullName(firstName: "Caner", lastName: "Uçar")
fullName("Caner", "Uçar")

//Dönüş tipli değer atadığımızda
func calculateFullName(_ firstName:String,_ lastName:String)->String{
    return(firstName + " " + lastName)
}

let FLname = calculateFullName("Cnr", "Ucr")
print(FLname)


func calculateFullNameWithLength(_ firstName:String,_ lastName:String)->(name:String, length:Int){
   let fullName = firstName + " " + lastName
    return (fullName, fullName.count)
}
let (_,nameLength) = calculateFullNameWithLength("Cnr", "Ucrr")
nameLength


/* ------------------------------------------------------------ */

func printMultipleOf(number: Int,multiplier:Int){
    print("\(number) * \(multiplier) = \(number * multiplier)")
}

printMultipleOf(number: 5, multiplier: 5)

func printMultipleOf2(_ number:Int,multiplier:Int=1){
    print("\(number) * \(multiplier) = \(number * multiplier)")
}
printMultipleOf2(5)


/* ------------------------------------------------------------ */

func getValue() -> Int{
    return 31
}
func getValue() -> String{
    return "Haw"
}
let valueInt:Int = getValue()
let valueString:String = getValue()

/* ------------------------------------------------------------ */

func add(number:Int,number2:Int) -> Int{
    return number + number2
}
var function = add
function(4,4)

/* ------------------------------------------------------------ */
typealias Operate = (Int,Int)->Int

func printResult(_ operation: Operate, _ a:Int, _ b:Int){
    let result = operation(a,b)
    print(result)
}
printResult(add, 4, 2)

/* Optional ------------------------------------------------------------ */

var sonuc:Int? = 30
print(sonuc ?? "Değer Boş")


var catName: String? = "Princess"
var catAge: Int? = 7

/*var unwrappedCatName = catName!
print("The cat's name is\(unwrappedCatName)")*/

/*Nil geldiğinde patmalaması için*/

if let catName = catName, let catAge = catAge{
    
    print("The Cat's name is\(catName) and she is \(catAge)")
}else{
    print("No cat name or cat age")
}

//ya da
func printCatInfo(catName:String?,catAge:Int?){
    guard let catName = catName, let catAge = catAge else{
        print("No cat name or cat age")
        return
    }
        print("The Cat's name is\(catName) and she is \(catAge)")
}

printCatInfo(catName: "Karabaş", catAge: 3)
printCatInfo(catName: "Kara", catAge: nil)


var myFavoriteSong:String? = "Cem Adrian"

if let song = myFavoriteSong{
    print("Benim favori şarkım : \(song)")
}else{
    print("Favari şarkınız yok")
}



func printNickName(_ nickname:String?){
    guard let nickname = nickname else {
        print("No Nickname")
        return
    }
    print("Nickname : \(nickname)")
}

printNickName("Galatasaray")
printNickName(nil)

//Guard hatayı başta yakalar
func sifirdanBuyukMu(_ sayi:Int){
    guard sayi>0 else {
        print("Sayı 0'dan büyük değil")
        return
    }
    print("Sayı Sıfırdan büyüktür.")
}

sifirdanBuyukMu(-2)
