import UIKit

/*
 Variadic Fonksiyonlar - Değişken sayıda parametre alan fonksiyonlar
 Swiftte bir fonksiyonun parametresi değişken sayıda parametre olabilir
 calculateAverage fonksiyonunun numbers parametresine "..." üç nokta sayesinde 0 ile sonsuz parametre gönderilebilir
 NOT: Bir fonksiyonun iki tane "variadic" parametresi olamaz
 */

func calculateAverage(numbers:Double...)->Double{
//Variadic yapmak istediğimiz parametrenin türünün sonun 3 nokta koyuyoruz
    var sum: Double = 0
    
    for number in numbers {
        sum += number
    }
    let average = sum / Double(numbers.count)
    return average
}

//Gördüğünüz gibi numbers parametresine "," virgül ile istediğim sayıda parametre gönderdik
print(calculateAverage())
print(calculateAverage(numbers: 1))
print(calculateAverage(numbers: 1,2))
print(calculateAverage(numbers: 1,2,3))
