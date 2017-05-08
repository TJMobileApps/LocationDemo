//
//  ViewController.swift
//  LocationDemo
//
//  Created by Spencer Atkin on 5/8/17.
//  Copyright © 2017 TJ Mobile Apps. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    var lastLocation: CLLocation?
    var distanceTraveled = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        //mapView.showsUserLocation = true

        // Add location tracking button
        let userTrackingButton = MKUserTrackingBarButtonItem(mapView: mapView)
        navigationItem.rightBarButtonItem = userTrackingButton
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapOutlet(_ sender: Any) {
        if let location = manager.location { // Get current location from CLLocationManager
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = "Visited location"
            mapView.addAnnotation(annotation)
        }
        
        let alertController = UIAlertController(title: "Choose map style", message: nil, preferredStyle: .actionSheet)
        let standard = UIAlertAction(title: "Standard", style: .default) { (action) in
            self.mapView.mapType = .standard
        }
        let satellite = UIAlertAction(title: "Satellite", style: .default) { (action) in
            self.mapView.mapType = .satellite
        }
        let hybrid = UIAlertAction(title: "Hybrid", style: .default) { (action) in
            self.mapView.mapType = .hybrid
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(standard)
        alertController.addAction(satellite)
        alertController.addAction(hybrid)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if lastLocation != nil {
            distanceTraveled += lastLocation!.distance(from: locations.last!)
        }
        lastLocation = locations.last
        print("traveled \(distanceTraveled) meters")
    }
}

