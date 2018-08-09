//
//  ViewController.swift
//  captureGame
//
//  Created by Caner Uçar on 6.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var jobs1: UIImageView!
    @IBOutlet weak var jobs2: UIImageView!
    @IBOutlet weak var jobs3: UIImageView!
    @IBOutlet weak var jobs4: UIImageView!
    @IBOutlet weak var jobs5: UIImageView!
    @IBOutlet weak var jobs6: UIImageView!
    @IBOutlet weak var jobs7: UIImageView!
    @IBOutlet weak var jobs8: UIImageView!
    @IBOutlet weak var jobs9: UIImageView!
    
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var jobsArray = [UIImageView]()
    var hideTimer = Timer()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        let highScore = UserDefaults.standard.object(forKey: "highscore")
        
        if highScore == nil{
            highScoreLabel.text = "0"
        }
        if let newScore = highScore as? Int{
            highScoreLabel.text = String(newScore)
        }
        
        scoreLabel.text = "Score: \(score)"
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreArttir))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreArttir))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreArttir))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreArttir))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreArttir))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreArttir))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreArttir))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreArttir))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreArttir))
        
        jobs1.isUserInteractionEnabled = true
        jobs2.isUserInteractionEnabled = true
        jobs3.isUserInteractionEnabled = true
        jobs4.isUserInteractionEnabled = true
        jobs5.isUserInteractionEnabled = true
        jobs6.isUserInteractionEnabled = true
        jobs7.isUserInteractionEnabled = true
        jobs8.isUserInteractionEnabled = true
        jobs9.isUserInteractionEnabled = true
        
        jobs1.addGestureRecognizer(recognizer1)
        jobs2.addGestureRecognizer(recognizer2)
        jobs3.addGestureRecognizer(recognizer3)
        jobs4.addGestureRecognizer(recognizer4)
        jobs5.addGestureRecognizer(recognizer5)
        jobs6.addGestureRecognizer(recognizer6)
        jobs7.addGestureRecognizer(recognizer7)
        jobs8.addGestureRecognizer(recognizer8)
        jobs9.addGestureRecognizer(recognizer9)
        
        
        //Timers
        
        counter = 10
        timeLabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.scoreDown), userInfo: nil, repeats: true)
        
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideJobs), userInfo: nil, repeats: true)
        
        //Array
        jobsArray.append(jobs1)
        jobsArray.append(jobs2)
        jobsArray.append(jobs3)
        jobsArray.append(jobs4)
        jobsArray.append(jobs5)
        jobsArray.append(jobs6)
        jobsArray.append(jobs7)
        jobsArray.append(jobs8)
        jobsArray.append(jobs9)
        
        hideJobs()
       
    }
    
    @objc func hideJobs()
    {
        for jobs in jobsArray
        {
            jobs.isHidden = true //Görünmez yaptık
        }
        
        let random = Int(arc4random_uniform(UInt32(jobsArray.count - 1)))
        
        jobsArray[random].isHidden = false
        
        
    }
    
   
    
   
    
    
    
    
    @objc func scoreArttir()
    {
        scoreLabel.text = "Score: \(score)"
        score = score + 1
    }
    @objc func scoreDown()
    {
        counter = counter - 1
        timeLabel.text = "\(counter)"
        if counter == 0
        {
            timer.invalidate()
            hideTimer.invalidate()
            
            
            if self.score > Int(highScoreLabel.text!)!
            {
                UserDefaults.standard.set(self.score, forKey: "highscore")
                highScoreLabel.text = String(self.score)
            }
            
            let alert = UIAlertController(title: "Süre", message: "Süreniz Bitmişrir", preferredStyle: UIAlertControllerStyle.alert)
            
            let replayButton = UIAlertAction(title: "Yeniden Oyna", style: UIAlertActionStyle.default) { (UIAlertAction) in
            
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = "\(self.counter)"
                
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.scoreDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.hideJobs), userInfo: nil, repeats: true)
            }
            
            let okButton = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
            
            alert.addAction(replayButton)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }

   


}

