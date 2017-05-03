//
//  RequestResultPresent.swift
//  HITRUM
//
//  Created by SSd on 5/3/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit
import MapKit
class RequestResultPresent: UIViewController {
    
    var locationManager : CLLocationManager?
    var startLocation : CLLocation?
    let mapKit = MKMapView()
    let requestLocationView = UIView()
    let requestLabel = UILabel()
    let requestLocationDotImage = UIImageView(image: #imageLiteral(resourceName: "request_location_dot"))
    
    let resultCollection = ResultCollectionViewController(collectionViewLayout : ResultLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupLocation(){
        locationManager = CLLocationManager()
        mapKit.translatesAutoresizingMaskIntoConstraints = false
        mapKit.isZoomEnabled = true
        mapKit.isRotateEnabled = true
        mapKit.isScrollEnabled = true
        mapKit.showsUserLocation = true
        mapKit.showsPointsOfInterest = true
        mapKit.showsBuildings = true
        mapKit.setUserTrackingMode(.follow, animated: true)
        mapKit.delegate = self
        
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.delegate = self
        
        locationManager?.requestWhenInUseAuthorization()
    }

}
extension RequestResultPresent: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mapKit.showsUserLocation = true
        let userLocation:CLLocationCoordinate2D = manager.location!.coordinate
        let long = userLocation.longitude;
        let lat = userLocation.latitude;
        let rwDevCon = CLLocation(latitude: lat, longitude:long)
        let regionRadius: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(rwDevCon.coordinate, regionRadius, regionRadius)
        mapKit.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager?.startUpdatingLocation()
        }
    }
    
}


extension RequestResultPresent: MKMapViewDelegate {
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("rendering")
    }
}
