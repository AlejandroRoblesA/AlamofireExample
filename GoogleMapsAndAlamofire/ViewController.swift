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
    
    var userCurrentLocationButton(){
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawGoogleMap()
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

