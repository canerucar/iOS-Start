//
//  ViewController.swift
//  haberApp
//
//  Created by Caner Uçar on 15.09.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import UIKit
import AEXML //Xml bir yapıyı parçalamak için
import Alamofire
import SDWebImage

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //Elemanlarımızı dizilerde tutmak için dizi tanımlıyoruz
    
    var titles = [String]()
    var descriptions = [String]()
    var urls = [String]()
    var newsImageUrls = [String]()
    
    @IBOutlet var myTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //veriyi çağırıyoruz
        AF.request("http://www.trt.net.tr/rss/cenre.rss").response{(response)in
            
            //response'un datasından gelen xml datası
            guard let xmlData = response.data else {return}
            
            let options = AEXMLOptions()
            
            do{
                let xmlDoc = try AEXMLDocument(xml: xmlData, options: options)
                //print(xmlDoc.root["channel"]["item"]["title"].value!)
                
                //Tüm verileri çağırmak işlemi
                
                if let items = xmlDoc.root["channel"]["item"].all{
                    
                    for item in items{
                        /*if let title = item["title"].value{
                            print(title)
                        }
                        if let description = item["description"].value{
                            print(description)
                        }
                        if let link = item["link"].value{
                            print(link)
                        }
                        */

                        //Tüm başlıkları titles arrayimizde topladık
                        self.titles.append(item["title"].string)
                        self.descriptions.append(item["description"].string)
                        self.urls.append(item["link"].string)
                        
                        //image'i aldık
                        let enclosure = item["enclosure"]
                        if let newsImgaeUrl = enclosure.attributes["url"]{
                            //print(newsImgaeUrl)
                            
                            self.newsImageUrls.append(newsImgaeUrl)
                        }
                    }
                    //Tableview'ı veri ile dolduracak şekilde ekle
                    self.myTableview.reloadData()
                }
            }catch{
                print("Hata oluştu")
            }
        }
    }
    
    //TABLEVIEW işlemleri
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! NewsTableViewCell
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.sd_setImage(with: URL(string: newsImageUrls[indexPath.row]))
        
        cell.title.text = titles[indexPath.row]
        cell.url.text = urls[indexPath.row]
        
        //cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        
        //Veriyi diğer storyboarda gönderiyoruz
        let newsDetailVC = storyboard?.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailViewController
        //Hangi satıra tıkladıysak onun detayı
        newsDetailVC.newsDetail = descriptions[indexPath.row]
        self.present(newsDetailVC,animated: true, completion: nil)
    }

}

