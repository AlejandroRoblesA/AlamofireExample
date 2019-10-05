//
//  ViewController.swift
//  GoogleMapsAndAlamofire
//
//  Created by Alejandro on 10/2/19.
//  Copyright © 2019 Alejandro Robles. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    var userLocation: CLLocation!
    var mapView:       GMSMapView!
    var zoomCamara:    Float = 17.0
    var anguloCamara   = 0.0
    var bearingCamara  = 0.0
    
    let userCurrentLocationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawGoogleMap()
        
        userCurrentLocationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        userCurrentLocationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        userCurrentLocationButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userCurrentLocationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func drawGoogleMap(){
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        handleUserCurrentLocation()
    }
    
    func handleUserCurrentLocation(){
        if userLocation != nil {
            let camera = GMSCameraPosition(target: userLocation.coordinate, zoom: zoomCamara, bearing: bearingCamara, viewingAngle: anguloCamara)
            mapView.animate(to: camera)
        }
    }
}

