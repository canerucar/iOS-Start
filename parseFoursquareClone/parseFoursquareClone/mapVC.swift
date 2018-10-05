//
//  mapVC.swift
//  parseFoursquareClone
//
//  Created by Caner Uçar on 14.09.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import MapKit
import Parse

class mapVC: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    var chosenLatitude = ""
    var chosenLongitude = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //imageVC de yazdığımız değişkenleri burdada çağırabiliyoruz
        //globalName = ""
        
        mapView.delegate = self
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest //gösterebildiği en iyi konumu göster
        manager.requestWhenInUseAuthorization() //kullanıcı sadece uygulamayı kullanırken lokasyon kullan
        manager.startUpdatingLocation()
        
        //haritaya basılı tuttuğumuzda
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(mapVC.chooseLocation(gestureRecognizer:)))
        recognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(recognizer)
    }
    
    //her açıldığında sıfırlama işlemi
    override func viewWillAppear(_ animated: Bool) {
        self.chosenLongitude = ""
        self.chosenLatitude = ""
    }
    
    @objc func chooseLocation(gestureRecognizer: UIGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            
            
            let touches = gestureRecognizer.location(in: self.mapView)
            let coordinates = self.mapView.convert(touches, toCoordinateFrom: self.mapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            annotation.title = globalName
            annotation.subtitle = globalType
            
            self.mapView.addAnnotation(annotation)
            
            self.chosenLatitude = String(coordinates.latitude)
            self.chosenLongitude = String(coordinates.longitude)
            
            
        }
        
    }
    
    //lokastyon bilgisi güncellenince neolacak
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        //lokasyon sadece zoom yapılan yerde kalmaması için
        manager.stopUpdatingLocation()
        
        //zoom seviyesi
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
    }

    
    @IBAction func saveClicked(_ sender: Any) {
        
        let object = PFObject(className: "Places")
        object["name"] = globalName
        object["type"] = globalType
        object["atmosphere"] = globalAtmosphere
        object["latitude"] = self.chosenLatitude
        object["longitude"] = self.chosenLongitude
        
        if let imageData = UIImageJPEGRepresentation(globalImage, 0.5) {
            object["image"] = PFFile(name: "image.jpg", data: imageData)
        }
        
        object.saveInBackground { (success, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                
                
                
                self.performSegue(withIdentifier: "frommapVCtoplacesVC", sender: nil)
                
            }
        }
    }
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
