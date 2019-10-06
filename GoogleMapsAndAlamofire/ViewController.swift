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
    
    
    let userCurrentLocationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 22.5
        button.setImage(UIImage(named: "currentLocation"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawGoogleMap()
        userCurrentLocationButtonConstraints()
        
    }
    
    func userCurrentLocationButtonConstraints(){
        
        view.addSubview(userCurrentLocationButton)
        
        userCurrentLocationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        userCurrentLocationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        userCurrentLocationButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        userCurrentLocationButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func drawGoogleMap(){
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(-33.86, 151.20)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "You are here"
        marker.map = mapView
        
    }
    
    
}

