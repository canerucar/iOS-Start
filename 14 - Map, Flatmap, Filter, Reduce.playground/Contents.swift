import UIKit

/* -- Elimizde bir dizi olsun. Dizinin elemanları şehirler.
 Örnek : izmir,ankara,eskişehir,istanbul yazacağınız fonksyion dizinin elemanlarının harflerinin tümünü büyütsün : İZMİR
 */

var cities = ["izmir","ankara","eskişehir","istanbul"]
var newArray = [String]()

/*func upparcasedCities(){
for city in cities {
    newArray.append(city.uppercased())
    }
}
upparcasedCities()
print(newArray)*/

/*upparcasedCities Fonksiyonunun kısa yönetimi
 
 Map burada $0 ile tüm elemanları gezerek uppercased() ile şehirlerin tüm harflerini büyütüyor. ‘for döngüsüne’ gerek duymadan tüm elemanlarla işlem yapabilmiş oluyoruz
 
 
 */
newArray = cities.map({$0.uppercased()})
print(newArray)

/*----------------------------------------------------*/

/* -- Elimizde şu şekilde bir dizi olsun:
 [["izmir","ankara","istanbul"],["eskişehir","bursa","adana"]] sizden beklenen diziyi şu şekilde yazmanız :
 ["izmir","ankara","istanbul","eskişehir","bursa","adana"]
 iki diziyi tek bir dizi haline getirin
 */

var sehirler = [["izmir","ankara","istanbul"],["eskişehir","bursa","adana"]]
var yeniDizi = [String]()

/*for sehir in sehirler {
    for sehir2 in sehir {
        yeniDizi.append(sehir2)
    }
}
print(yeniDizi)*/

/*Daha basit hali flatMap ile
 Flatmap, bir dizi içinde farklı diziler varsa bunları tek dizide birleştirir.
 Flatmap ile aynı zamanda elinize gelecek veride işinize yaramayanları kaldırmak içinde kullanılabilir. Örneğin elinizde bazı elemanları nil olan bir dizi varsa bunlarla işlem yapmak istemiyorsanız, flatmap imdadınıza erişiyor.
 */

print(sehirler.flatMap({$0})) /*CompactMap'de olur*/

/*----------------------------------------------------*/

/* -- Elimizde elemanları tamsayılar olan bir dizinin bir diziden çift veya tek sayıları ayıran bir donksiyon yazalım
 */

let numbers = [1,2,3,4,5,6,7,8,9,10]
var tekSayilar = [Int]()
var ciftSayilar = [Int]()

/*for number in numbers {
    if number % 2 == 0 {
        ciftSayilar.append(number)
    }
    else{
        tekSayilar.append(number)
    }
}
print(ciftSayilar)
print(tekSayilar)*/

/*Yine kolay olan yönetemini yazalım*/

print(numbers.filter{$0 % 2 == 0})
print(numbers.filter{$0 % 2 != 0})

/*Elimizdeki dizinin elemanlarının toplamını veren bir program yazınız*/

let sayilar = [1,2,3,4,5,6,7,8,9,10]

var total = 0
for number in sayilar{
    total += number
}
print(total)

/*Kısa Yöntemi
 Reduce, fonksiyonu elimizdeki dizinin elemanlarından tek bir değer döndürür.
 */
print(sayilar.reduce(0,+))

print(numbers.reduce(0, {$0 + $1}))
/*
reduce fonksiyonundaki ilk değer 0 olarak tanımlandı. Bu yukardaki total = 0 ile aynı anlama gelmektedir.
toplama işlemi en az iki sayının toplanması ile yapıldığından, ilk elemanı temsil eden $0 ikincisini ise $1 dir.*/

/*Son sayının 1 fazlasını bulup ve kendisiyle çarpıp bulan kod satırı*/
print(sayilar.last! * (sayilar.last! + 1)/2)
