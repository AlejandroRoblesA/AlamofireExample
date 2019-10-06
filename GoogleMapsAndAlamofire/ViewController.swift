//
//  ViewController.swift
//  GoogleMapsAndAlamofire
//
//  Created by Alejandro on 10/2/19.
//  Copyright © 2019 Alejandro Robles. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var mapView: GMSMapView?
    
    let userCurrentLocationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 22.5
        button.setImage(UIImage(named: "currentLocation"), for: .normal)
//        button.addTarget(self, action:, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawGoogleMap()
        userCurrentLocationButtonConstraints()
        navigationItemBarSettings()
    }
    
    func navigationItemBarSettings(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next place", style: .plain, target: self, action:  #selector(handleNextLocation))
    }
    
    func userCurrentLocationButtonConstraints(){
        
        view.addSubview(userCurrentLocationButton)
        
        userCurrentLocationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        userCurrentLocationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        userCurrentLocationButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        userCurrentLocationButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func drawGoogleMap(){
        
        let camera = GMSCameraPosition.camera(withLatitude: 19.432895, longitude: -99.133194, zoom: 17)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(19.432895, -99.133194)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "You are here"
        marker.snippet = "Somewhere..."
        marker.map = mapView
        
    }
    
    @objc func handleNextLocation(){
//        19.295879, -99.210608
        let nextLocation = CLLocationCoordinate2DMake(19.295879, -99.210608)
        mapView?.camera = GMSCameraPosition.camera(withLatitude: nextLocation.latitude, longitude: nextLocation.longitude, zoom: 17)
        
        let marker = GMSMarker(position: nextLocation)
        marker.title = "Six"
        marker.map = mapView
    }
    
}

