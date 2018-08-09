//
//  ViewController.swift
//  simpsonBook
//
//  Created by Caner Uçar on 9.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [simpson]()
    var chosenSimpson = simpson()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.navigationItem.title = "Simpson Characters"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let bart = simpson()
        bart.name = "Bart Simpson"
        bart.occupation = "Student"
        bart.image = UIImage(named: "images/bart.png")!
        
        let homer = simpson()
        homer.name = "Homer Simpson"
        homer.occupation = "Nuclear Safety Inspector"
        homer.image = UIImage(named: "images/homer.png")!
        
        let lisa = simpson()
        lisa.name = "Lisa Simpson"
        lisa.occupation = "Student"
        lisa.image = UIImage(named: "images/lisa.png")!
        
        let maggie = simpson()
        maggie.name = "Maggie Simpson"
        maggie.occupation = "Student"
        maggie.image = UIImage(named: "images/maggie.png")!
        
        let marge = simpson()
        marge.name = "Marge Simpson"
        marge.occupation = "Homer Maker"
        marge.image = UIImage(named: "images/marge.png")!

        //simpson array
        
        mySimpsons.append(bart)
        mySimpsons.append(homer)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        mySimpsons.append(marge)
    }
    //tableView Bağlama İşlemi
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    //Seçildiğinde neler olacak
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetails", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails"{
            let destinationVC = segue.destination as! detailsVC
        destinationVC.selectedSimpson = self.chosenSimpson
        }
    }

}

