//
//  FirstViewController.swift
//  instagramCloneFirebase
//
//  Created by Caner Uçar on 13.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SDWebImage

class feedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var useremailArray = [String]()
    var postCommentArray = [String]()
    var postImageURLArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromSever()
    }
    
    func getDataFromSever()
    {
        Database.database().reference().child("users").observe(DataEventType.childAdded) { (snapshot) in
            
            let values = snapshot.value! as! NSDictionary
            
            let post = values["post"] as! NSDictionary
            
            let postIDs = post.allKeys
            
            for id in postIDs {
                
                let singlePost = post[id] as! NSDictionary
                
                self.useremailArray.append(singlePost["postedby"] as! String)
                self.postCommentArray.append(singlePost["posttext"] as! String)
                self.postImageURLArray.append(singlePost["image"] as! String)
                
            }
            
            self.tableView.reloadData()
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return useremailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! feedCellVC
      
        cell.postText.text = postCommentArray[indexPath.row]
        cell.usernameLabel.text = useremailArray[indexPath.row]
        cell.postImage.sd_setImage(with: URL(string: self.postImageURLArray[indexPath.row]))
        
        return cell
    }

    @IBAction func logOutClicked(_ sender: Any) {
        //çıkış yaptıktan sonra kullanıcıyı tekrar hatırlamaması
        
        UserDefaults.standard.removeObject(forKey: "user")
        UserDefaults.standard.synchronize()
        
        let signIn = self.storyboard?.instantiateViewController(withIdentifier: "signInVC") as! signInVC
        
        let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = signIn
        
        delegate.rememberLogin()
        
    }
    
}

