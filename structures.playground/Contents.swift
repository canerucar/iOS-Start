import UIKit

typealias Inches = Int

struct Pizza {
    enum Topping {
        case cheese
        case mushrooms
        case peppers
    }
    enum Crust{
        case thick
        case thin
    }
    
    let topping: [Topping]
    let size: Inches
    let crust: Crust
}
let pizzaTopping: Pizza.Topping = .mushrooms
let pizza = Pizza(topping: [.cheese, .mushrooms], size: 14, crust: .thick)

/*--------------------------------------------------*/

struct Wizard{
    var firstName:String
    var lastName:String
    
    var fullName: String{
        get {return "\(firstName) \(lastName)"}
        set(newFullName){
            let nameSubstrings = newFullName.split(separator: " ")
            
            guard nameSubstrings.count>=2 else {
                print("\(newFullName) is not a full name")
                return
            }
         }
    }
}
var wizard = Wizard(firstName: "Gandalf", lastName: "Greyjoy")
wizard.firstName = "Hermione"
wizard.lastName = "Kenobi"
wizard.fullName

wizard.fullName = "SeverusWenderlich"

/*Enum--------------------------------------------------*/

enum Weekday: CaseIterable{
    case monday,tuesday,wednesday,thursday,friday,saturday,sunday
    
     mutating func advance(by dayCount: UInt){
        let indexOfToday = Weekday.allCases.firstIndex(of: self)!
        let indexOfAdvancedDay = indexOfToday + Int(dayCount)
        
       self = Weekday.allCases[indexOfAdvancedDay % Weekday.allCases.count]
    }
}
Weekday.allCases
var weekday: Weekday = .tuesday
weekday.advance(by: 6)


struct Time{
    var day: Weekday
    var hour: UInt
    
    init(day: Weekday, hour:UInt = 0) {
        self.day = day
        self.hour = hour
    }
}
var time = Time(day: .monday)
