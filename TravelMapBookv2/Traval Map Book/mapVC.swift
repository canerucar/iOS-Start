//
//  tableVC.swift
//  Traval Map Book
//
//  Created by Caner Uçar on 10.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class mapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var AciklamaText: UITextField!
    @IBOutlet weak var yer: UITextField!
    @IBOutlet weak var baslikText: UITextField!
    
    var locationManager = CLLocationManager()
    var requestCLLocation = CLLocation()
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    var slectedTitle = ""
    var slectedSubtitle = ""
    var slectedLatitude : Double = 0
    var slectedLongitude : Double = 0
    var yeradi: UITextField?
    var mesaj: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(mapVC.chooseLocation(gestureRecognizer:)))
        recognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(recognizer)
        
    
        
        if slectedTitle != "" {
            
            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: self.slectedLatitude, longitude: self.slectedLongitude)
            annotation.coordinate = coordinate
            annotation.title = self.slectedTitle
            annotation.subtitle = self.slectedSubtitle
            self.mapView.addAnnotation(annotation)
            yeradi?.text = self.slectedTitle
            mesaj?.text = self.slectedSubtitle
            
        }
    }

    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let chosenCordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            chosenLatitude = chosenCordinates.latitude
            chosenLongitude = chosenCordinates.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = chosenCordinates
            annotation.title = yeradi?.text
            annotation.subtitle = mesaj?.text
            // allter Text
            let alertController = UIAlertController(title: "Travel Book", message: "Harika! Bunu hemen kaydet", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Kaydet", style: .default, handler: self.okHandler)
            let cencelAction = UIAlertAction(title: "Çık", style: .cancel, handler: nil)
            
            alertController.addAction(okAction)
            alertController.addAction(cencelAction)
            
            alertController.addTextField(configurationHandler: yeradi)
            alertController.addTextField(configurationHandler: mesaj)
            
            self.present(alertController, animated:  true)
            // Ekleme Bitti
            self.mapView.addAnnotation(annotation)
            
        }
    }
    func yeradi(textField: UITextField) {
        yeradi = textField
        yeradi?.placeholder = "Buraya Bu Yerin Adını Girin"
    }
    func mesaj(textField: UITextField) {
        mesaj = textField
        mesaj?.placeholder = "Burası ile ilgili açıklama girin"
    }
    
    func okHandler(alter: UIAlertAction!){
        // Kaydetme işlemini bu fonksiyona tanımlıyoruz....
        self.saveBotton(true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseID =  "MyAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            pinView?.canShowCallout = true
            pinView?.pinTintColor = UIColor.red
            let button = UIButton(type: UIButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        } else {
            pinView?.annotation = annotation
        }
        return pinView
    
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if slectedLatitude != 0 {
            if slectedLongitude != 0 {
                self.requestCLLocation = CLLocation(latitude: slectedLatitude, longitude: slectedLongitude)
                
            }
        }
        
        CLGeocoder().reverseGeocodeLocation(requestCLLocation) { (placemarks, error) in
            if let placemark = placemarks {
                
                if placemark.count > 0 {
                    let newPlacemark = MKPlacemark(placemark: placemarks![0])
                    let item = MKMapItem(placemark: newPlacemark)
                    item.name = self.slectedTitle
                    
                    let  launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                    item.openInMaps(launchOptions: launchOptions)
                    
                }
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lacation = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: lacation, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func saveBotton(_ sender: Any) {
    
        let appDalegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDalegate?.persistentContainer.viewContext
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context!)
        
        newPlace.setValue(yeradi?.text, forKey: "title")
        newPlace.setValue(mesaj?.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        
        
        do {
            try context?.save()
            print("kayit Basarili")
        } catch{
            print("hata var!")
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newPlace"), object: nil)
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
}

