//
//  ViewController.swift
//  haberstk
//
//  Created by Caner Uçar on 9.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class ViewController: UIViewController, WKUIDelegate, UIWebViewDelegate,WKNavigationDelegate {
    
    
    @IBOutlet weak var webViewOutlet: WKWebView!
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       /* let myURL = URL(string: "https://www.haberstk.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest) */
        
     
        //Web verisini çekmek
        
        let webConfiguration = WKWebViewConfiguration()
        let customFrame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 0.0, height: self.webViewOutlet.frame.size.height))
        self.webView = WKWebView (frame: customFrame , configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.webViewOutlet.addSubview(webView)
        webView.topAnchor.constraint(equalTo: webViewOutlet.topAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: webViewOutlet.rightAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: webViewOutlet.leftAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: webViewOutlet.bottomAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: webViewOutlet.heightAnchor).isActive = true
        webView.uiDelegate = self
        
        
        let myURL = URL(string: "https://www.haberturk.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.allowsBackForwardNavigationGestures = true
        webView.load(myRequest)
        
        
        //YÜKLENİYOR LOGOSU ALERT
        
        SVProgressHUD.setDefaultStyle(.custom)
        //SVProgressHUD.setForegroundColor(UIColor.red)           //Ring Color
        //SVProgressHUD.setBackgroundLayerColor(UIColor.green)
        
        
        SVProgressHUD.setMinimumSize(CGSize(width: 80, height: 80))
        SVProgressHUD.setRingThickness(3)
        SVProgressHUD.setRingNoTextRadius(20)
        SVProgressHUD.setBackgroundColor(UIColor.gray)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.show()
        SVProgressHUD.show(withStatus: "Yükleniyor...")
        
        //Yükleniyor logosu ekranda kalma süresi
        DispatchQueue.main.async
        {
            Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        }
        
    }
    
    //Yükleniyor logosu durdurma- başarısız
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        webViewOutlet.reload()
        SVProgressHUD.dismiss()
    }
    
    @objc func update()
    {
        webView.reload()
        SVProgressHUD.dismiss()
        
    }
    
    //internet olmadığında ekrana çıkacak olan uyarı
    override func viewDidAppear(_ animated: Bool)
    {
        if CheckInternet.Connection()
        {
            
        }
        else
        {
            SVProgressHUD.dismiss()
            self.Alert(Message: "Lütfen İnternete Bağlanın")
        }
    }
    
    func Alert (Message: String){
        
       /* let alert = UIAlertController(title: "UYARI", message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        */
        
        
        //internet olmadığında ekrana çıkacak olan uyarı ALERT
        let alertController = UIAlertController (title: "İnternete Bağlı Değilsiniz", message: "Ayarlara Git", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Ayarlar", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: "App-Prefs:root=WIFI") else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        alertController.addAction(settingsAction)
        //let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        //alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    
   
    
}





