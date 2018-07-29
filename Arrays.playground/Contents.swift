//: Playground - noun: a place where people can play

import UIKit

var favoriteMovie = ["pulp fiction","Lost in Space","Better Call Saul"] //diziye string değerler atadık

favoriteMovie[0] // dizinin ilk değeri

favoriteMovie.count //dizinin uzunluğu

favoriteMovie.isEmpty //boş mu dolu mu kontrol

favoriteMovie.append("Breaking Bad") //Diziye yeni bir değer atadık

favoriteMovie

favoriteMovie.sort() //Sıralama

var favoriteNumbers = [1,5,7,9] //Sayı bir değerde atabiliriz

//dictionaries

var myFavoriteDirectors = ["Pulp Fiction" : "Quentin Tarantino", "Lock,Stock" : "Guy Ritchie", "The Dark Knight ": "Christopher Nolan"]

myFavoriteDirectors["Pulp Fiction"]
myFavoriteDirectors["Lock, Stock"] = "Mr. Ritchie"

myFavoriteDirectors.dropFirst() //ilk elemanı kaldır
myFavoriteDirectors.dropLast() //son elemanı kaldır


