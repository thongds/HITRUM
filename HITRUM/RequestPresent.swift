//
//  RequestPresent.swift
//  HITRUM
//
//  Created by SSd on 5/1/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

import MapKit
class RequestPresent: BaseViewController {

    var locationManager : CLLocationManager?
    var startLocation : CLLocation?
    let mapKit = MKMapView()
    let requestLocationView = UIView()
    let requestLabel = UILabel()
    let requestLocationDotImage = UIImageView(image: #imageLiteral(resourceName: "request_location_dot"))
    
    let requestButtomArea = UIView()
    var requestButtomAreaHeight : CGFloat = 0
    
    let dropdownBigIco = UIImageView(image: #imageLiteral(resourceName: "dropdown_big_ico"))
    
    //request eara element
    
    var leftWidth : CGFloat = 0
    
    let headerBackground = UIView()
    
    let castIco = UIImageView(image: #imageLiteral(resourceName: "cast_ico"))
    let priceLabel = UILabel()
    let infoIco = UIImageView(image: #imageLiteral(resourceName: "info_ico"))
    
    let multiPeopleIco = UIImageView(image: #imageLiteral(resourceName: "multi_people_ico"))
    let peopleSelectedLabel = UILabel()
    let peopleDropDowSmallIco = UIImageView(image: #imageLiteral(resourceName: "dropdown_small_ico"))
    let peopelUnderline = UIView()
    
    let clockIco = UIImageView(image: #imageLiteral(resourceName: "clock_ico"))
    let clockDropDownSmallIco = UIImageView(image: #imageLiteral(resourceName: "dropdown_small_ico"))
    let clockSelectedLabel = UILabel()
    let clockUnderLine = UIView()
    
    let generateIco = UIImageView(image: #imageLiteral(resourceName: "people_ico"))
    let generateLabel = UILabel()
    let generateDropDownIco = UIImageView(image: #imageLiteral(resourceName: "dropdown_small_ico"))
    let generateUnderline = UIView()
    
    let giftIco = UIImageView(image: #imageLiteral(resourceName: "gift_ico"))
    let giftTextField = UITextField()
    let giftUnderline = UIView()
    
    let noteIco = UIImageView(image: #imageLiteral(resourceName: "pencial_ico"))
    let noteTextField = UITextField()
    let noteUnderline = UIView()
    
    let requestButton = UIButton.activeButtonWithOutRadius()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftWidth = (view.frame.width - 30 )/2
        requestButtomAreaHeight = view.frame.height * 1/3 + 60
        viewElementAction()
        setupLocation()
    }
    
    func viewElementAction(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.showChooseLocationPage))
        requestLocationView.isUserInteractionEnabled = true
        requestLabel.isUserInteractionEnabled = true
        requestLocationView.addGestureRecognizer(tap)
        requestLabel.addGestureRecognizer(tap)
    }
    func showChooseLocationPage(){
        //navigationController?.pushViewController(ChooseLocationViewController(), animated: true)
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
extension RequestPresent: CLLocationManagerDelegate {
    
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


extension RequestPresent: MKMapViewDelegate {
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("rendering")
    }
}


