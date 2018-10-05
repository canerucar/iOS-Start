//
//  imageVC.swift
//  parseFoursquareClone
//
//  Created by Caner Uçar on 14.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

    var globalName = ""
    var globalType = ""
    var globalAtmosphere = ""
    var globalImage = UIImage()

class imageVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var placeNameTexr: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeAtmosphereText: UITextField!
    @IBOutlet weak var placeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //fotoğraf seçmek için tıklanabilir
        placeImage.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageVC.selectImage))
        placeImage.addGestureRecognizer(gestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Boş olduklarından emin olmak için
        
         globalName = ""
         globalType = ""
         globalAtmosphere = ""
         globalImage = UIImage()
    }

    @objc func selectImage()
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true,completion: nil)
    }
    
    //fotoğraf seçildikten sonra ne yapılacak
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        placeImage.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil) //picker ı
    }
   

    @IBAction func nextClicked(_ sender: Any) {
        
        if placeNameTexr.text != "" && placeTypeText.text != "" && placeAtmosphereText.text != "" {
            
            if let chosenImage = placeImage.image {
                
                globalName = placeNameTexr.text!
                globalType = placeTypeText.text!
                globalAtmosphere = placeAtmosphereText.text!
                globalImage = chosenImage
                
            }
        }
        
        self.performSegue(withIdentifier: "fromimageVCtomapVC", sender: nil)
        
        placeNameTexr.text = ""
        placeTypeText.text = ""
        placeAtmosphereText.text = ""
        placeImage.image = UIImage(named: "selectimage.png")
    }
    
}
