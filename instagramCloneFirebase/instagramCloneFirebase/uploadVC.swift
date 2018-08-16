//
//  SecondViewController.swift
//  instagramCloneFirebase
//
//  Created by Caner Uçar on 13.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class uploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postComment: UITextView!
    
    var uuid = NSUUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImage.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(uploadVC.choosenPhoto))
        postImage.addGestureRecognizer(recognizer)
        
    }

    @objc func choosenPhoto()
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    //fotoğfarı seçtikten sonra ne olacak
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        postImage.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let mediaFolder = storageRef.child("media")
        
        if let data = UIImageJPEGRepresentation(postImage.image!, 0.5) {
            let mediaImagesRef = mediaFolder.child("\(uuid).jpg")
            mediaImagesRef.putData(data, metadata: nil) { (metadata, error) in
                if error != nil {
                    //Alert button
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    mediaImagesRef.downloadURL { url, error in
                        if error != nil {
                            // Alert Button
                            let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                            alert.addAction(okButton)
                            self.present(alert, animated: true, completion: nil)
                        } else {
                            
                            
                            
                            self.postImage.image = UIImage(named: "select.png")
                            self.postComment.text = ""
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                }
            }
        }
            }
        }


