//
//  LocationManager.swift
//  RequestUserLocation
//
//  Created by Muhammad Zeeshan on 20/08/2024.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    static let shared = LocationManager()
    private var maneger = CLLocationManager()
    @Published var userLocation: CLLocation?
    
    override init() {
        super.init()
        maneger.delegate = self
        maneger.desiredAccuracy = kCLLocationAccuracyBest
        maneger.startUpdatingLocation()
    }
    
    func requestLocation() {
        maneger.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("DEBUG Not Determined")
        case .restricted:
            print("DEBUG Restricted")
        case .denied:
            print("DBUG Denied")
        case .authorizedAlways:
            print("DEBUG Auth always")
        case .authorizedWhenInUse:
            print("DEBUG Auth When in Use")
        case .authorized:
            print("DEBUG Authorize")
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.userLocation = location
    }
}
