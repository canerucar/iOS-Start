//
//  mapVC.swift
//  TravelMapBook
//
//  Created by Caner Uçar on 11.08.2018.
//  Copyright © 2018 Caner Uçar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation //Kullanıcının nerede olduğunu öğrenmek için
import CoreData

class mapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var requestCLLocation = CLLocation()
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    var selectedTitle = ""
    var selectedSubtitle = ""
    var selectedLatitude : Double = 0
    var selectedLongitude : Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //Lokasyon bilgisi daha net şekilde bulur aynı zamanda en çok pili harcar
        //locationManager.requestAlwaysAuthorization() - bunu kullanırsak kullanıcının sürekli lokasyon bilgisini alırız
        locationManager.requestWhenInUseAuthorization()//ama şimdilik gerektiğinde alacağız
        locationManager.startUpdatingLocation()
        
        //haritaya uzun basılı tuttuğumuzda
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(mapVC.chooseLocation(gestureRecognizer:)))
        recognizer.minimumPressDuration = 2 //kaç saniye basılı tutulacak
        mapView.addGestureRecognizer(recognizer)
        
        
        if selectedTitle != "" {
            
            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: self.selectedLatitude, longitude: self.selectedLongitude)
            annotation.coordinate = coordinate
            annotation.title = self.selectedTitle
            annotation.subtitle = self.selectedSubtitle
            self.mapView.addAnnotation(annotation)
            
            nameText.text = self.selectedTitle
            commentText.text = self.selectedSubtitle
            
            
         
            
        }
        
    }
    
    @objc func chooseLocation(gestureRecognizer : UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.began { //eğer başladıysa
            
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let chosenCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            //seçilmiş kordinatdan enlem ve boylamları aldık
            chosenLatitude = chosenCoordinates.latitude
            chosenLongitude = chosenCoordinates.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = chosenCoordinates
            annotation.title = nameText.text
            annotation.subtitle = commentText.text
            self.mapView.addAnnotation(annotation)
            
            
        }
        
        
    }
    
    //kullanıcının lokasyonunu alıp bir dizi halinde veriyor
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        //kullanıcının enlem ve boylamını aldık //latitude = enlem, longitute = boylam
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        //ne kadar zoom yapaağım
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        //bir bölge istiyor
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //location'da açıldığına emin olmak için şunları ekleyebiliriz.
        locationManager.stopUpdatingLocation()
        
        if selectedTitle != "" {
        
        let locationChosen = CLLocationCoordinate2D(latitude: self.selectedLatitude, longitude: self.selectedLongitude)
        let spanChosen = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let regionChosen = MKCoordinateRegion(center: locationChosen, span: spanChosen)
        mapView.setRegion(regionChosen, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseID = "myAnnotation"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            pinView?.canShowCallout = true
            pinView?.pinTintColor = UIColor.black
            
            let button = UIButton(type: UIButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
            
        } else {
            pinView?.annotation = annotation
        }
        
        
        return pinView
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if selectedLatitude != 0 {
            if selectedLongitude != 0 {
                self.requestCLLocation = CLLocation(latitude: selectedLatitude, longitude: selectedLongitude)
            }
        }
        
        CLGeocoder().reverseGeocodeLocation(requestCLLocation) { (placemarks, error) in
            if let placemark = placemarks {
                
                if placemark.count > 0 {
                    
                    let newPlacemark = MKPlacemark(placemark: placemark[0])
                    let item = MKMapItem(placemark: newPlacemark)
                    item.name = self.selectedTitle
                    
                    let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                    item.openInMaps(launchOptions: launchOptions)
                    
                }
                
                
            }
        }
        
        
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        
        do {
            try context.save()
            print("saved")
        } catch {
            print("error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newPlace"), object: nil)
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    

}

