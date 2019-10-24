import UIKit

var dizi: [Int] = [3,5,8,10]

for i in dizi{
    print(i)
}


//int ve string anahtar vei ikililerinden oluşacak biçimde tanımlanmıştır
var x:Dictionary<Int,String>=[112:"Ambulans",155:"Polis"]

for i in x{
    print(i)
}

func xL(a:Int,b:Int,c:Int) ->Int
{
    return a*b*c
}
print("1*2*3=\(xL(a:1,b:2,c:3))")

//Sınıf yapısı nesneye yönelimli programlamanın en temel yapısıdır.Bir sınıf yapısı içinde bir nesne oluşturmak için gerekli veri ve metotlar(fonksiyonlar) birlikte tanımlanır. Nesneye yönelik programlamanın bu özelliğine paketleme (encapsulation) adı verilir.

class Daire{
    
    var r:Double
    init(yc:Double) {
        r=yc
    }
    
    func cevre() -> Double {
        return 2*3.14159 * r
    }
    
    func alan() -> Double {
        return 3.14159*r*r
    }
}

var dd = Daire(yc: 4.0)
print("Dairenin Yarı Çapı=\(dd.r)")
print("Dairenin Çevresi=\(dd.cevre())")
print("Dairenin Alanı=\(dd.alan())")

//Yapılar Structures
//Swift’teki yapı (structure), esasında C dilindeki yapı (struct) ile benzerlik gösterir, fakat arada büyük bir fark da mevcuttur. Swift’teki yapılarda değişkenler yanında metotlar da tanımlanabilir; oysa C’de bu mevcut değildir.


struct Dairex{
    
    var r:Double
    init(yc:Double) {
        r=yc
    }
    func cevre() -> Double {
        return 2*3.14159*r
    }
    
    func alan() -> Double {
        return 3.14159 * r * r
    }
}
var kk = Daire(yc: 4.0)

print("DAİRENİN YARI ÇAPI=\(kk.r)")

print("DAİRENİN ÇEVRESİ=\(kk.cevre())")

print("DAİRENİN ALANI=\(kk.alan())")

//Initializers parametre almayan fonksiyon gibidir Initialization, class ‘tan, enum ‘dan veya struct ‘dan bir instance oluşturacağımız zaman hazırlanma işlemidir.

//İlk olarak bir struct oluşturacağız, bu struct ‘ımızın ismi Derece olsun ve bir adet stored property’ miz olsun,

struct Derece{
    
    var sıcaklık:Double
    init() {
        sıcaklık = 17.0
    }
    
}
//İlk olarak Derece isminde bir struct yaratıcaz ve bu struct ‘ımızın bir değişkeni olacak ve ardından initialization işlemini parametre alacak şekilde gerçekleştireceğiz. Burada paremetre olarak Fahrenheit bir değer alıp onu init methodumuzun içerisinde dereceye çevireceğiz. 1 celsius (fahrenheit – 32 ) / 180 fahrenheit ‘dır.

struct DereceXL{
    
    
    var sıcaklıkDerece: Double
    
    init(fahrenheittanDereceye fahrenheit:Double) {
        sıcaklıkDerece = (fahrenheit - 32.0) / 1.8
    }
}

//Init Dış Paremetre İsmi Olmadan Kullanım

struct DereceL {
    
    var sicaklikDerece: Double
    //init methodumuzu yazarak “_ “ kullanarak gelen değerimizi sicaklikDerece değişkenimize eşitledik. Çünkü ikiside aynıdır.
    init( _ celsius: Double){
        
        sicaklikDerece = celsius
        
    }
    
}

//Deinitialization
//Bir sınıf nesnesi Otomatik Referans Sayacı (ORS) mekanizması tarafından heap ’ten yok edilmeden hemen önce o nesne için o sınıfın deinit metodu çağrılır. deinit metodunun parametresi ve geri dönüş değeri yoktur. Bir başka deyişle, objemiz deallocate edilmeden önce işlemler yapmak  için deinit metodunu kullanabiliriz. Deinit metodu objemiz deallocate edilmeden önce çalışır. Hemen genel tanımlaması nasılmış görelim,

class OrnekSinif{
    
    var a:Int
    init() {
        a=0
        print("Örnek İnit")
    }
    init(a:Int) {
        self.a = a
        print("Örnek İnit")
    }
    deinit {
        print("Örnek deinit")
    }
    
}

var sinifInstance:OrnekSinif? = OrnekSinif()
print("Init deneme")
sinifInstance = nil
print("Deinit Deneme")

//İlk olarak OrnekSinif isminde bir sınıf yarattık. Bu sınıfın a isminde Int türünde bir değişkeni bulunmaktadır. Ve bu sınıfın iki adet init methodu bulunmaktadır bunlardan biri parametresiz diğeri ise parametrelidir. Bunların dışında bir de deinit methodumuz bulunmaktadır ve bu methodumuzun içinde ekrana “Örnek deinit” yazısını bastırıyoruz. Ve sınıfımızı yarattıktan sonra OrnekSinif ‘ımızdan bir instance türetiyoruz ve ismine sinifInstance diyoruz. Biz bu tanımlamayı yaptıktan sonra parametre almayan init methodumuz çalışacaktır çünkü a değişkenimize her hangi bir parametre vermedik bu yüzden parametresiz init methodumuz çalışacak ve a değişkenimizin değeri 0 olacaktır. Ardından ise ekrana “Örnek init” yazısını bastıracaktır.  Ve ardından ise işleyişe devam edecek ve ekrana “Init Deneme” yazısını bastıracaktır. Bir sonraki satırda ise instance ‘ımızı nil yaparak deallocate etmiş oluyoruz bu durumda ise sınıfımızın deinit fonksiyonunun çalışmasını sağlıyoruz. Ve deinit fonksiyonumuz çalışıp ekrana “Örnek Deinit” yazısını bastıracaktır ve tekrar işleyişine devam edip bir satır altına ise “Deinit Deneme” yazısını bastıracaktır.


//Sayma tipi
enum Ad{
    //Grup Bilgi tanımı
}


enum Kita{
    
    case Avrupa
    case Amerika
    case Asya
    case Afrika
    
}
let cc = Kita.Asya

//Enumeration  tipi switch-case ile birlikte de kullanılır:

switch cc {
    
case.Amerika:print("Amerikayı Seçtiniz")
case.Avrupa:print("Avrupayı Seçtiniz")
case.Asya:print("Asyayı Seçtiniz")
case.Afrika:print("Afrikayı Seçtiniz")

}

//DELEGE ETME (DELEGATION)
//
//Delege etme özelliği, nesneye yönelik programlamanın ve Swift’in önemli özelliklerinden biridir. Delege etme deyince anlaşılan şudur: bir sınıf ya da yapıdan üretilen bir nesnenin kendi sorumluluklarından bazılarını başka bir sınıf nesnesine aktarabilme mekanizmasıdır. Genellikle bir protokol içinde delege edilecek sorumluluklar tanımlanır. Delegation özelliği genellikle, belirli tipteki eylemlere reaksiyon vermek ya da kaynak tipi ile ilgilenmeden dış kaynaktan veri almak gibi işlemlerde kullanılır.

func DiziOlus<ElTip>(el: ElTip, sayi: Int) -> [ElTip] {
    
    var sonuc = [ElTip](repeating: el, count: sayi)
    
    return sonuc
    
}



print(DiziOlus(el: 6, sayi: 4))

print(DiziOlus(el: 7.5, sayi: 5))

print(DiziOlus(el: "aa", sayi: 9))

//Inheritance Nedir ?
//Inheritance kelime anlamı olarak miras demektir. Inheritance bir sınıfın, başka sınıftan miras almasıdır. Miras alan sınıfa subclass, miras alınan sınıfa ise superclass denir. Miras almayı günlük hayatımızdan bir örnekle açıklayabiliriz,



//Base class, herhangi bir sınıftan miras almayan sınıflara verilen isimdir. Hemen bir örnek ile açıklayalım. Bir Hayvanlar sınıfımız olsun ve bu Hayvanlar sınıfımızın sesCikart diye bir fonksiyonu olsun. Bu sınıftan Kopek sınıfımız miras alsın ve Hayvanlar sınıfının fonksiyonunu override etsin,

class Hayvanlar{
    
    func sesÇıkart(){
        
    }
}

class Kopek:Hayvanlar{
    
    override func sesÇıkart() {
        print("Hav")
    }
    
}
var kopek = Kopek()
kopek.sesÇıkart()

class Kedi:Hayvanlar{
    override func sesÇıkart() {
        print("Miyav")
    }
    
}

//Şimdi Kedi sınıfımızdan bir instance oluşturalım ve sesCikart fonksiyonunu çağıralım,

var kedi = Kedi()
kedi.sesÇıkart()

//Miras Alan Sınıftan Miras Alınır Mı ?
//Evet miras alan bir sınıftan başka bir sınıf miras alabilir. Hemen bir örnekle açıklayayım,
//Bir köpek türü olan Sivas Kangal ‘ının HAAAAAAAAV-HAAAAAAAAAV diye havladığını varsayalım. Kopek sınıfından miras alan bir Kangal sınıfımız olsun. Ve bu Kangal sınıfında Kopek Sınıfından gelen fonksiyonumuzu override edelim,
class Kangal:Kopek{
    
    override func sesÇıkart() {
        print("Kangal Köpeeğiyim")
    }
    
}

//Kopek sınıfımız Hayvanlar sınıfımızdan miras almıştı. Kangal sınıfımız ise Kopek sınıfımızdan miras almış oldu. sesCikart fonksiyonumuzu yukarıda bahsettiğim gibi yazdık. Şimdide Kangal sınıfımızdan bir instance oluşturalım ve sesCikart fonksiyonumuzu çağıralım,

var kangalsivas = Kangal()
kangalsivas.sesÇıkart()

var dolar:Double = 5.4

for i in 2...7{
    
    print("\(i) Dolar = \(dolar*Double(i)) Türk Lirası")
    
}

//parametresiz fonksiyon

func XX()->String{
    
    return "Caner Uçar"
}
for i in 1...5{
    print(XX())
}

//Delege etme özelliği, nesneye yönelik programlamanın ve Swift’in önemli özelliklerinden biridir. Delege etme deyince anlaşılan şudur: bir sınıf ya da yapıdan üretilen bir nesnenin kendi sorumluluklarından bazılarını başka bir sınıf nesnesine aktarabilme mekanizmasıdır. Genellikle bir protocol içinde delege edilecek sorumluluklar tanımlanır. Delegation özelliği genellikle, belirli tipteki eylemlere reaksiyon vermek ya da kaynak tipi ile ilgilenmeden dış kaynaktan veri almak gibi işlemlerde kullanılır.

class GerYaz{ //delegate
    func yaz(){
        print("Türkiyem")
    }
    
}

class YAZ{ //delegator
    
    var p = GerYaz()
    func yaz(){
        p.yaz() //delegation
    }
}

var yz = YAZ()
yz.yaz()

//Aşağıdaki örnekte MotorTasit adlı bir super sınıftan otomobil adlı bir alt sınıf türetilmiştir. Her ikisinde de yaz adlı metot aynı isim ve farklı içeriktedir:

class MotorTasit
{
    var tip: String = "İçten Yanmalı Motor"
    
    func yaz(){
        print("MOTORLU TAŞITLAR..\(tip)..Kullanılır")
    }
    
}

class Otomobil:MotorTasit{
    
    var ad:String=""
    
    func otomobil(tip:String){
        self.tip=tip;
    }
    
    override func yaz(){
        
        super.yaz()
        print("OTOMOBİL\(tip)..Kullanılır")
        
    }
}
var mercedes = Otomobil()
mercedes.ad = "MERCEDES"
mercedes.yaz()//Dinamik bağlama
print("TİP\(mercedes.ad)..DİR")


//Aşağıdaki örnek kod ile, sehir adlı yapıya extension yardımı ile su alanlarını simgeleyen su adlı özellik eklenmiş ve ilk değer ataması yapılmıştır:

struct konum{
    
    var enlem = 0.0, boylam = 0.0
}
struct nufus {
    var insan = 0.0,ticarihacim=0.0
}
struct sehir {
    var yer = konum()
    var boyut = nufus()
}

extension sehir{
    
    var su:Int{
        get {return 0}
    set(su){
    
    }
    }
}
let k = sehir()
print("ENLEM=\(k.yer.enlem)")
print("Boylam=\(k.yer.boylam)")
print("Nüfus=\(k.boyut.insan)")
print("Ticari Hacim=\(k.boyut.ticarihacim)")
print("Su Alanları=\(k.su)")

protocol Tutar{
    
    //protokol tanımı
    var tut: Double {get}
}
//Protokol, belirli bir işi gerçekleştirmek için gerekli metotlar, özellikler ve diğer gereksinimlerin bir planını tanımlar. Protokol, bu işi aktif olarak gerçekleştirmez bir anlamda işin tanımını ortaya koyar. İşin gerçekleştirimi ise bir sınıf, yapı ya da enumeration ile gerçekleştirilir.
//hesap adlı struct ise Tutar adlı protokolü kullanmaktadır:

struct hesap:Tutar{
    var tut: Double
    var miktar: Double
    
    //yapı tanımı
}
var a = hesap(tut: 1000.0, miktar: 50.0)

print("TUTAR=\(a.tut)")
print("Miktar=\(a.miktar)")

//ANY VE ANY OBJECT SÖZCÜKLERİ
//
//
//
//Swift, spesifik olmayan veri tipleri ile çalışmak için iki özel tip sözcüğü içermektedir; bunlar any ve anyobject sözcükleridir.
//
//AnyObject, herhangi bir sınıf örneğini (nesnesini) temsil edebilir. Any sözcüğü ise fonksiyon tipleri hariç herhangi bir tipteki örneği temsil edebilir.
class Kitap{
    
    var ad: String
    
    var yazar:String
    
    init(ad: String, yazar: String) {
        
        self.yazar = yazar
        
        self.ad=ad
        
    }
    
}
let kitaplar : [AnyObject] = [
    
    Kitap(ad: "Çankaya", yazar: "F.Rıfkı Atay"),
    
    Kitap(ad: "İnce Memet", yazar: "Yaşar Kemal"),
    
    Kitap(ad: "Sisler Bulvarı", yazar: "Attila İlhan"),
    
    Kitap(ad: "Her Gece Bodrum", yazar: "Selim İleri")]



for nesne in kitaplar{
    
    let kit = nesne as! Kitap
    
    print("KİTAP : \(kit.ad), YAZAR.. \(kit.yazar)")
    
}

var nesne = [Any]()

nesne.append(21)
nesne.append(4.34)
nesne.append(2.12)

nesne.append("Ordu")
nesne.append((6.0,15.0))

print(nesne)


//üç boyutlu dizi tanımlama

var ucBoyut: [[[Int]]] = [[[11,3],[43,56]],[[45,43]],[[52,55]]]
print(ucBoyut)


//üçlü koşul operatörü
//koşul ? true ise yapılacak iş : false ise yapılacak iş



