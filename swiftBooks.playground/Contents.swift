//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let apples = 3
let oranges = 5

let appleSummary = "Benim \(apples + oranges) meyvem var"

let quotation = " I said I have \(apples) apples."

let array = ["Caner","Uçar","1997"]

array[0]

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Kaylee"]

let emptyArray = [String]()
// ---------------------------------------------------------
let individualScores = [75,43,105,88,12]

var teamScore = 0
var score = 0
for score in individualScores
{
    if score > 50
    {
        teamScore += 3
    }
    else
    {
        teamScore += 1
    }
}
print(teamScore)



