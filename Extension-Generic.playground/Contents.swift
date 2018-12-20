import UIKit

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


