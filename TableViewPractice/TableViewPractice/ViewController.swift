//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Caner Uçar on 20.11.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import UIKit

let houseData = ["Arryn", "Baratheon", "Greyjoy", "Lannister", "Martell", "Stark", "Targaryen", "Tully", "Tyrell"]

let wordsData = ["As high as honor", "Ours is the fury", "We do not sow", "Hear me roar", "Unbowed, unbent, unbroken", "Winter is coming", "fire and blood", "Family, duty, honor", "Growing strong"]

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.title = "UITableView"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
    }
}



extension UIViewController : UITableViewDataSource, UITableViewDelegate{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houseData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.commonInit("got_\(indexPath.item)", title: houseData[indexPath.item], sub: wordsData[indexPath.item])
        cell.selectionStyle = .default
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.commonInit("got_bg_\(indexPath.item)", title: houseData[indexPath.item])
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
