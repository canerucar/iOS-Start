//
//  ViewController.swift
//  ses-Dosyasi-Oynatma
//
//  Created by Caner Uçar on 6.11.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import AVFoundation //Ses dosyası kütüphanesi

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPressed(_ sender: UIButton){
        
        //Önce hangi butonun tıklandığı bilgisini alıyoruz. chosenSound tıklanan butonun tagIndex ini tutmuş oluyor.Daha sonra bu tagIndex i playSound metodu içinde parametre olarak veriyoruz.
        
        let chosenSound = sender.tag
        playSound(soundIndex: chosenSound)
    }
}

extension ViewController:AVAudioPlayerDelegate{
    
    //Parametre olarak bir integer değer alıyoruz. Biz buraya butonun tag index ini veriyoruz.
    func playSound(soundIndex: Int){
        //Müzik dosyasının yerini belirtiyoruz. “beep” den sonra gelen kısım önemli çünkü buraya müziğin tag index ini yazacağız. Dolayısıyla tag index ile müziğin numerik kısmı birbiriyle uyuşmalı.Yarattığımız audioPlayer içine müziği koymaya çalışıyoruz .Eğer koyabiliyorsa sesi oynatıyor, koyamıyorsa hatayı konsola yazıyor.
        let soundURL = Bundle.main.url(forResource: "beep\(soundIndex)", withExtension: "wav")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    
}

