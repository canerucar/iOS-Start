//
//  detailsViewController.swift
//  Aktuel
//
//  Created by Caner Uçar on 11.10.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//
import UIKit
import GoogleMobileAds



class detailsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    
    
    @IBOutlet weak var navBarItemOutlet: UINavigationItem!
    @IBOutlet weak var tableViewDetails: UITableView!
    @IBOutlet weak var admobDetails: GADBannerView! //UIView yerine yazdık
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDetails.delegate = self
        tableViewDetails.dataSource = self
        
        let talep = GADRequest() //Reklam talep ediyoruz
        talep.testDevices = [kGADSimulatorID] //Simulatorde gerçek reklam göstermeyip admob tarafından kara listeye alınabilir
        admobDetails.adUnitID = "ca-app-pub-9535434814729620/7481015648"
        admobDetails.rootViewController = self
        admobDetails.load(talep)
        
        
        //NavBardaki Titlea Market adlarını atıyoruz
        navBarItemOutlet.title = mTuple[myIndex].1
        
        
        //HTTPS güvenlik açısından info.plistten ayarımızıda yaptık. yoksa çalışmayacaktı
        let myURL = URL(string: "http://vitrindirim.com/api/aktuel-urunler/all")!
        let session = URLSession.shared
        //internete bağlanıp veriyi çekeceğiz
        let task = session.dataTask(with: myURL, completionHandler: { (data, response, error) in
            
            //eğer hata varsa
            if error != nil
            {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                if data != nil
                {
                    do {
                        
                        let jSONResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject>
                        
                          DispatchQueue.main.async { //indirdiğimz datanın hızlı gelmesi için arka planda hızlandırma
                            print(jSONResult) //JSON Verilerini LOG'da görmemiz için basıyoruz
                            
                            //let urunler = jSONResult["urunler"] as! [String:AnyObject]
                            
                            //let aciklamalar = String(describing: urunler["aciklama"]!)
                            
                            
                            
                            //let cell = detailsCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "detailsCell") //MenuCell sınıfında hücre şablonumuzu elde ediyoruz
                            
                            //let bos = jSONResult[""] as! [String : AnyObject]
                            //let urunler = jSONResult["urunler"] as! [String : AnyObject]
                            
                            //let aciklama = String(describing: urunler["aciklama"]!)
                            //cell.urunlerAciklama.text = "USD: \(aciklama)"
                            
                           
                            
                            
                        }
                        
                        
                    } catch {
                        
                    }
                    
                }
                
            }
            
        })
        
        task.resume()
        
        setupNavBar()
    }
    
    
    
    func setupNavBar()
    {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mTuple.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        //cell.textLabel?.text = "Marketler"
        //return cell
        
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "Caner Uçar"
        //return cell
        
        //let cell = tableViewDetails.dequeueReusableCell(withIdentifier: "detailsCell") as! detailsCell
         //cell.detailsBackgroundImage.image = UIImage(named: mTuple[indexPath.row].0)
        
        
        
        //seçilen cell'in arkaplan rengi /sonradan değişecektir
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView
        
        
        return cell
        
       
        
      
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
        myIndex = indexPath.row
        performSegue(withIdentifier: "brosurSegue", sender: self)
        
        
    }
    
    
}
