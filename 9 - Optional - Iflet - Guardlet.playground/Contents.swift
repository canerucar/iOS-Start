import UIKit

var myName : String? //? string olabilirde olmayabilirde

myName?.uppercased()

// Optionals : ? v !

var myAge = "5" //ama kullanıcı yazıyla da beş yazabilir

var myResult = Int(myAge)! * 5 //ünlem işareti, eminim demektir ama riskli

if let number = Int(myAge){ //ünlem kullanmaktansa if let kullanıp bir filtre uygulamak daha sağlıklı
    let result = number * 5
    print(result)
}

var xd:String? = "Swift"

//İlk değer olarak bizden kesin bir şey istiyor.

//İster boş değer verin, isterseniz dolu verin ama değer verin

print(xd ?? "Geçersiz Değer")

//Opsiyonel Bağlama (Optional Binding)

var baglamaDegiskeni: String?

let atananSabit = baglamaDegiskeni

print("Opsiyonel Değil = \(atananSabit)")
print("Opsiyonel = \(baglamaDegiskeni)")





// if let kullanımı  -- Optional ifadelerden kurtulmak için kullanırız
// Json Parse işlemi yaparken
// if let yada guard let yapısını kullanacağız

//var sehir:String? // ? ile optional olduğu belirtilir
//print(sehir ?? "Boş Değer")
//print(sehir as Any) //Uyarıdan kurtarır sizi

var city:String?
//print(sehir!) // ! işareti ile unwrap yaparak optional kelimesinden de kurtarır
//En uygun yöntemlerden biri : if let
//let il = sehir
//print(il!)

if let il = city {
    print("ilin ismi: \(il)")
} else{
    print("Değer okunamadı")
}

// if let kullanımı  -- Optional ifadelerden kurtulmak için kullanırız
// Json Parse işlemi yaparken
// if let yada guard let yapısını kullanacağız

//guard let
struct Uyeler {
    var name:String?
    var email:String?
    var password:Int?
}

var uyem = Uyeler(name: "Caner", email: "info@canerucar.com", password: 12345)
//print(uyem.name) //Optionalden kurtulmak için guard let yazacığız

func uyeGetir(uye:Uyeler){
    //Hepsinin true olması lazım. önce veriye bakıyor sonra hata
    if let name = uye.name, let email = uye.email, let password = uye.password{
        print(name)
        print(email)
        print(password)
    } else{

        print("Verileriniz okunamadı")
    }
}


// Guard yapısı hatayı başta yakalar
func uyeGetirm(uye:Uyeler){
    
    guard let name = uye.name, let email = uye.email, let password = uye.password else{
        
        print("Verileriniz okunamadı")
        return
    }
    
    print(name)
    print(email)
    print(password)
}

uyeGetir(uye: uyem)
