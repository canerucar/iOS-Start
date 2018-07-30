//
//  ViewController.swift
//  simpleCalculator
//
//  Created by Caner Uçar on 30.07.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    /* Yazılan kod ile kısa notlar
     - if let yerine kullanıcı textfielda bastığında sadece rakamlardan oluşan klavyeyide çıkartabilirdik
     
 
    */
    
    
    @IBOutlet weak var birinciSayiText: UITextField!
    @IBOutlet weak var ikinciSayi: UITextField!
    @IBOutlet weak var sonucLabel: UILabel!
    
    var sonuc = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()
        sonucLabel.text = ""
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func toplamaButton(_ sender: Any)
    {
        if let firstNumber = Int(birinciSayiText.text!)
        {
            
            if let secondNumber = Int(ikinciSayi.text!)
            {
                sonuc = firstNumber+secondNumber
                sonucLabel.text = String(sonuc)
            }
            else
            {sonucLabel.text = "Lütfen bir sayı giriniz"}
        }
        else
        {
            sonucLabel.text = "Lütfen bir sayı giriniz"
            
        }
    }
    
    @IBAction func cikarmaButton(_ sender: Any)
    {
        if let firstNumber = Int(birinciSayiText.text!)
        {
            
            if let secondNumber = Int(ikinciSayi.text!)
            {
                sonuc = firstNumber-secondNumber
                sonucLabel.text = String(sonuc)
            }
            else
            {sonucLabel.text = "Lütfen bir sayı giriniz"}
        }
        else
        {
            sonucLabel.text = "Lütfen bir sayı giriniz"
            
        }
    }
    
    @IBAction func carpmaButton(_ sender: Any)
    {
        if let firstNumber = Int(birinciSayiText.text!)
        {
            
            if let secondNumber = Int(ikinciSayi.text!)
            {
                sonuc = firstNumber*secondNumber
                sonucLabel.text = String(sonuc)
            }
            else
            {sonucLabel.text = "Lütfen bir sayı giriniz"}
        }
        else
        {
            sonucLabel.text = "Lütfen bir sayı giriniz"
            
        }
    }
    
    @IBAction func bolmeButton(_ sender: Any)
    {
        if let firstNumber = Int(birinciSayiText.text!)
        {
            
            if let secondNumber = Int(ikinciSayi.text!)
            {
                sonuc = firstNumber/secondNumber
                sonucLabel.text = String(sonuc)
            }
            else
            {sonucLabel.text = "Lütfen bir sayı giriniz"}
        }
        else
        {
            sonucLabel.text = "Lütfen bir sayı giriniz"
            
        }
    }
    
}

