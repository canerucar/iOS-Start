import UIKit

//Arrays

//let pastries: [String] = ["cookie","cupcake","donut","pie","brownie"]
var pastries:[String] = []
pastries.append("cookie")
pastries += ["cupcake","donut","pie","brownie"]

//pastries.removeAll()
pastries.isEmpty

pastries.count
if let first = pastries.first,
    let min = pastries.min(),
    let max = pastries.max(){
    print("Dizinin ilk elemanı \(first)")
    print("Dizinin küçük elemanı \(min)")
    print("Dizinin büyük elemanı \(max)")
}



let firstElement = pastries[0]
let firstThree = Array(pastries[1...3])
firstThree[0]

//bunlar var mı
pastries.contains("donut")
pastries.contains("lasagna")

//hangi sıraya ekle
pastries.insert("tart", at: 0)

//Silme işlemleri
let removedTwo = pastries.remove(at: 2)
let removedLast = pastries.removeLast()

removedTwo
removedLast
pastries
//yer değiştirme
pastries.swapAt(0, 1)


//For döngüsü ile

for (index,pastry) in pastries.enumerated() {
    print(index,pastry)
}

let players = ["Belhanda","Gomis","Babel","Falcao"]
let scores = [4,7,11,13]

for (index,player) in players.enumerated() {
    print(player, scores[index])
}

/* Dictionary ----------------------------------- */

var emptyDictionary:[String:Int] = [:]

var namesAndPets = [

    "Ron" : "🖍 Rat",
    "Rincewind" : "📕 Luggage",
    "Thor" : "⌛️ Hammer",
    "Goku" : "🧭 Flying Nimbus"
]
print(namesAndPets)
namesAndPets["Rincewind"]
namesAndPets["Calvin"]

let calvinPet = namesAndPets["Calvin"] ?? "No pet for Calvin"

namesAndPets.isEmpty
namesAndPets.count

//namesAndPets.updateValue("Owl", forKey: "Ron")
namesAndPets["Calvin"] = "🦁 Tiger"

//namesAndPets.removeValue(forKey: "Goku")
namesAndPets["Goku"] = nil
print(namesAndPets)
print("-----------------------------")
for (character, pet) in namesAndPets {
    print("\(character) has a \(pet)")
}
print("-----------------------------")
for (name, _) in namesAndPets{
    print(name)
}
print("-----------------------------")
for pet in namesAndPets.values{
    print(pet)
}


/*Sets ---------------------------------------------------------------------*/

var someSet: Set<Int> = [1,2,3,1]

//let someArray: Array<Int>
//let someDictionary: Dictionary<String, Int>

someSet.contains(1)
someSet.contains(99)

someSet.insert(5)
let removedElement = someSet.remove(3)
someSet

let anotherSet: Set<Int> = [5, 7, 13]
let intersection = someSet.intersection(anotherSet)
let difference = someSet.symmetricDifference(anotherSet)
let union = someSet.union(anotherSet)

someSet.formUnion(anotherSet)
someSet
anotherSet

/*Closures ------------------------------*/

/*let multiply: (Int,Int) -> Int = { (a: Int, b:Int) -> Int in
    return a*b
}*/

/*let multiply: (Int,Int) -> Int = { (a, b) in
    a*b
}*/
let multiply: (Int,Int) -> Int = {
    $0 * $1
}


multiply(4,2)


