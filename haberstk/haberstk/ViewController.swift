//
//  ViewController.swift
//  haberstk
//
//  Created by Caner Uçar on 9.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate {
    
    
    @IBOutlet weak var webViewOutlet: WKWebView!
    var webView: WKWebView!
    
        //var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create Activity Indicator
        //activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        // Position Activity Indicator in the center of the main view
        //activityIndicator.center = view.center
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        //activityIndicator.hidesWhenStopped = false
        
        // Start Activity Indicator
        //activityIndicator.startAnimating()
        
        // Call stopAnimating() when need to stop activity indicator
        //activityIndicator.stopAnimating()
        
       /* let myURL = URL(string: "https://www.haberstk.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest) */
        
        
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
        
        let myURL = URL(string: "https://www.haberstk.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }}

