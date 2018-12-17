//
//  ViewController.swift
//  coreML-Camera
//
//  Created by Caner Uçar on 10.12.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
//    AVCaptureSession objesinden geelcek anlık görüntü verisini alabilmemiz için sınıfımızın AVCaptureVideoDataOutputSampleBufferDelegate protokolünü aşağıdaki gibi desteklemesi gerekiyor.

    @IBOutlet weak var tahmin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        //sessionPreset: Çıktısını alacağımız verinin tipi.
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            return
        }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else
        {
            return
        }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
//        previewLayer: Kamera görüntüsünü AVCapture oturumumuzdan alacak ve bizim ekranda görmemizi sağlayacak olan obje.Bu layer’ın width (genişlik) ve height(yükseklik) gibi bilgilerini de vererek ana view’ımızın sublayer’ı (alt layer’ı) olarak ekliyoruz.
        
        let dataOutput = AVCaptureVideoDataOutput();dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoOutput"))
        
        captureSession.addOutput(dataOutput)
        
    }
    
    // MARK: - Fonksiyonlar
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        // Anlık iletilen kamera akışından bir görsel yakalar.
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // CoreML modelimiz ile bir obje oluşturur.
        guard let model = try? VNCoreMLModel(for: MobileNet().model) else { return }
        
        // Modelimize göndereceğimiz isteği oluşturur.
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            
            // Modelden gelen cevabı belirtir.
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            // Modelin bize verdiği ilk sonucu alırız.
            guard let firstObservation = results.first else { return }
            
            // Arayüzde değişiklik yapacağımızdan öncelikle Main Queue'ya dönmeliyiz.
            DispatchQueue.main.async {
                // Ekranda bulunan label'a modelden gelen sonucu yazdırır.
                self.tahmin.text = "\(firstObservation.identifier) \(firstObservation.confidence * 100)"
            }
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }


}

