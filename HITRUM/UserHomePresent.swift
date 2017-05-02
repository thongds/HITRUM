//
//  UserHomePresent.swift
//  HITRUM
//
//  Created by SSd on 4/29/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit
import MapKit
import SideMenu

class UserHomePresent: BaseViewController {

    var locationManager : CLLocationManager?
    var startLocation : CLLocation?
    let mapKit = MKMapView()
    let requestLocationView = UIView()
    let requestLabel = UILabel()
    let requestLocationDotImage = UIImageView(image: #imageLiteral(resourceName: "request_location_dot"))
    var swipeArray = [UIScreenEdgePanGestureRecognizer]()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewElementAction()
        setupMenu()
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
        navigationController?.pushViewController(ChooseLocationViewController(), animated: true)
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
    func setupMenu(){
        let lefMenuViewController = MenuViewController()
        lefMenuViewController.view.backgroundColor = UIColor.white
        
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: lefMenuViewController)
        menuLeftNavigationController.leftSide = true
        
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        // SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        swipeArray = SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view, forMenu : .left)
        SideMenuManager.menuPresentMode = .menuSlideIn
        SideMenuManager.menuFadeStatusBar = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTapped(){
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
   
}
extension UserHomePresent: CLLocationManagerDelegate {
    
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


extension UserHomePresent: MKMapViewDelegate {
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("rendering")
    }
}










