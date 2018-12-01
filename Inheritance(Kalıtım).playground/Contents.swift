import UIKit


class Sporcu{
    
    var id       : Int
    var isim     : String
    var dogumyili: Int
    
    init(id: Int, isim: String, dogumyili: Int) {
        self.id = id
        self.isim = isim
        self.dogumyili = dogumyili
    }
    
    func sporaBasla(){
        
        print("Spora Başlandı")
    }
}

class futbolcu: Sporcu{
    
    var takim         : String?
    var formanumarasi : Int?
    
    override func sporaBasla() {
        super.sporaBasla()
        print("Futbola Başlandı")
    }
}

class tenisci: Sporcu{
    
    var raketMarkasi: String!
}

var sporcu = Sporcu(id: 1, isim: "Caner Uçar", dogumyili: 1997)
var futbol = futbolcu(id: 2, isim: "Yaren Battal", dogumyili: 1998)
futbol.formanumarasi = 10
futbol.takim = "Galatasaray"

print(futbol.isim)
futbol.sporaBasla()
