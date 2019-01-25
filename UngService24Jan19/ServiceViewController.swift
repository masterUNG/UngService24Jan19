//
//  ServiceViewController.swift
//  UngService24Jan19
//
//  Created by MasterUNG on 25/1/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit
import MapKit




class ServiceViewController: UIViewController {
    
    
    
    @IBOutlet weak var myMapView: MKMapView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

//       showMap(lat: 13.667693, lng: 100.621781)
        
        showMapType2(lat: 13.667693, lng: 100.621781)
        
    }   // Main Method
    
    func showMapType2(lat: Double, lng: Double) -> Void {
        
        let latitude:CLLocationDegrees = lat
        let longtitude:CLLocationDegrees = lng
        
        let laDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: laDelta, longitudeDelta: longDelta)
        let homeMaster: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: homeMaster, span: span)
        
        
        self.myMapView.setRegion(region, animated: true)
        
        
//        Home Master Anotation
        let homeAnotation = MKPointAnnotation()
        homeAnotation.coordinate = homeMaster
        homeAnotation.title = "Home Master UNG"
        homeAnotation.subtitle = "EWTC Institute"
        self.myMapView.addAnnotation(homeAnotation)
        
//        Bus Stop
        
        let latBus:CLLocationDegrees = 13.669372
        let longBus:CLLocationDegrees = 100.624802
        
        let busStopAnotation = MKPointAnnotation()
        busStopAnotation.coordinate = CLLocationCoordinate2D(latitude: latBus, longitude: longBus)
        busStopAnotation.title = "Bus Stop"
        busStopAnotation.subtitle = "Bus StopBus StopBus StopBus StopBus StopBus StopBus Stop"
        self.myMapView.addAnnotation(busStopAnotation)
        
        
        
        
        
    }
    
    func showMap(lat: Double, lng: Double) -> Void {
        
        let homeCoordinate = CLLocationCoordinate2DMake(lat, lng)
        let regionDistance: CLLocationDistance = 1000
        let regionSpan = MKCoordinateRegion.init(center: homeCoordinate, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        let placeMark = MKPlacemark(coordinate: homeCoordinate)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = "Home Master"
        mapItem.openInMaps(launchOptions: options)
        
    }
    

   

}   // Main Class
