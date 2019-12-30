import UIKit

//Encodable : Bu protokolü kabul ettirdiğiniz class’lar veya struct’lar kendilerini JSON formatına çevirebilme özelliğine sahip olurlar.
struct User: Encodable {
    
    var firstName: String
    var lastName : String
}

let user1 = User(firstName: "Caner", lastName: "Uçar")
let encoder = JSONEncoder()

do{
    //Artık json türünden bir data var
    let jsonData = try encoder.encode(User.init(firstName: "Caner", lastName: "Uçar"))
}catch let error{
    // Encode işlemi sırasında bir hata oluştu
    print(error)
}

//Decodable : Bu protokolü kabul eden class veya struct’lar JSON türünden bir datayı kullanarak kendi türlerinden objeler oluşturabilirler.

/*
 Elimizde aşağıdaki gibi bir JSON dosyası olduğunu düşünelim. Bu tür veriler genellikle sunucu tarafından uygulamamıza iletilir.
 {
 "firstname": "John",
 "lastname": "Doe",
 "age": 20
 }
 */

struct Account : Decodable{
    var firstN : String
    var lastN  : String
    var age    : Int
}

/*
 let jsonData = JSON veriniz
 let decoder = JSONDecoder()
 do {
 // Artık json kullanılarak oluşturulmuş bir Account objesine sahipsiniz!
 let account= try decoder.decode(User.self, from: jsonData)
 }catch let error {
 // Decode işlemi sırasında bir hata oluştu
 print(error)
 }
 */

// Codable : Kısaca Encodable ve Decodable protokollerinin birleşimidir. Bu protokolü kabul eden class ve struct’lar hem Encodable hem de Decodable protokollerini aynı anda kabul etmiş olur. CodingKeys
//CodingKeys, JSON key’lerinizi temsil etmek için farklı değişken isimlerini kullanmanıza izin verir.
/*Uygulaması
Örneğin ‘Fruit’ adında bir struct’ınız var ve bu struct’ta name adında bir değişken var. Fakat name değişkeninizin adı sunucunuzda fruit_name olabilir. Bu durumda CodingKeys kullanarak sizdeki değişkenin adının sunucudaki karşılığını belirtebilirsiniz.*/

struct Fruit: Codable {
    var name: String
    var originCountry: String
enum CodingKeys: String, CodingKey {
case name = "fruit_name"
case originCountry = "originCountry"
}
}

