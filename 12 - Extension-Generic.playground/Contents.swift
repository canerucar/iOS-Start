import UIKit

//Extension ile herhangi bir şeye yeni bir özellik katılır

var x = "deneme" //String bir değişkem

//x.characters.count //Swift 3'te böyleydi
x.count //swift 4

extension String{ //Hangi tipi extension yazacağız String
    var say:Int{ //Yazılan extensionun sonucunu Int istiyoruz
        return self.count
    }
}

x.say
var y = "Türkçe Swift Kodlama"
y.say

//------------------------------------------------------------

var a = 3.0 //Afrika ülkelerinden birinin para birimi
var b = 620.0 //Ülkemizdeki para birimi olsun

var c = a/b

//Virgülden sonra 2 basamak için : Sayı 100 ile çarpılır. 10 un 2. kuvveti
//Virgülden sonra 3 basamak için : Sayı 1000 ile çarpılır. 10 un 3. kuvveti
//Virgülden sonra 4 basamak için : Sayı 10000 ile çarpılır. 10 un 4. kuvveti

(c*1000)

var d = (c*1000).rounded() //Sayıyı yuvarlar
d/1000

extension Double{
    func sayiyiYuvarla(basamak:Int)->Double{
        let carpan = pow(10.0, Double(basamak)) //pow kuvvet alma fonksiyon
        return (self*carpan).rounded()/carpan
    }
}

var e = 0.23456

e.sayiyiYuvarla(basamak: 4) //Virgülden sonra haç basamak olacağını yazıyoruz

//sayıyı temsilen self kullanıyoruz

extension Int{
    mutating func kareAl(){
        self = self*self //Self'e atadık. 2 sayıyı çarpıp yine aynı sayıya atadığımız için mutasyona uğruyor. Ve fonksiyona mutating ekliyoruz
    }
    //Mutating olmayan versiyon
    func kareAlmak()->Int{
        return self*self
    }
    func cift()->String{
        if self % 2 == 0{
            return "Sayı Çifttir"
        } else{
            return "Sayı Tektir"
        }
    }
}
var k = 4
k.kareAl()
6.kareAlmak()
57.cift()
80.cift()

//------------------------------------------------------------------------------------

// Generics ile esnek ve yeniden kullanılabilir kodlar yazılır. Bu yapılar değişken tipinden bağımsızdır.

var sehirler = ["İstanbul","İzmir","Ankara"] // [String] Elemanları string olan bir array
var IntArray = [1,2,3] // [Int]  Elemanları int olan bir array
var DoubleArray = [3.14,2.5,3.5] // [Double]  Elemanları Double olan bir array

func iller(il:[String]){ //String türünde bir arrayim olsun
    for i in il{
        print(i)
    }
}
//iller(il: sehirler) ya da burda da tanımlayabilirdik
//iller(il: ["A","B","C"])


func tamSayilar(tamSayi:[Int]){
    for ts in tamSayi{
        print(ts)
    }
}


//tamSayilar(tamSayi: IntArray) -- Çağırdık
func ondalikliSayilar(ondalikliSayi:[Double]){
    ondalikliSayi.map {print($0)} //Closure tanımlaması. map : Generics'in sunduğu
}

//ondalikliSayilar(ondalikliSayi: DoubleArray)

//GENERİCS TANIMLAMASI - Tipin ne olduğuna bakmadan bir şekilde eleman yazdırma.
func herhangiBirArray<T>(array:[T]){
    array.map{print($0)}
}
herhangiBirArray(array: sehirler)
herhangiBirArray(array: IntArray)
herhangiBirArray(array: DoubleArray)

// IKI Parametreli ve Aynı TİPLİ GENERIC TANIMLAMASI
func ikiParametreli<T>(bir:T,iki:T){ //T : istenilen isim verilebilir
    
}

//IKI Parametreli ve FARKLI TİPLİ GENERIC TANIMLAMASI
func farkliTipliIkıParametreli<T,U>(bir:T, iki:U){
    
}


/*Generic
 Array değeri farketmezsizin yazdırabilmemiz için kullanırız */



//Classlara özellik eklemek istediğimiz zaman extensionları kullanırız
extension Float{
    
    var incValue:Float{
        return self * 0.393700787401575
    }
    var cmValue:Float{
        return self / 0.393700787401575
    }
    func birimEkle(_ birim:String) -> String {
        return "\(self) \(birim)"
    }
}

func printElements(str: String){
    
    for elements in str {
        print(elements)
    }
    
}
//Generic tip dönüş değeri any olarak tanımlayıp hem string gem int değerler çağırabiliriz

func printAnyElements<T>(anyArray: [T]){
    for deger in anyArray{
        print(deger)
    }
}

func printAnySeq<T: Sequence>(anything: T){
    for element in anything {
        print(element)
    }
}


let cmDeger: Float = 10.0
print("inch değeri:\(cmDeger.incValue)")

cmDeger.birimEkle("cm")

printElements(str: "Caner")
printAnyElements(anyArray: ["Caner", "UÇAR"])

printAnyElements(anyArray: [1,2,3,4,5])

printAnySeq(anything: "Canerimsi")


