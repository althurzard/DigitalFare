//
//  MapKit+Extension.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/28/20.
//

import Foundation
import MapKit

public extension MKMapView {
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 500) {
        let coordinateRegion = MKCoordinateRegion( center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
