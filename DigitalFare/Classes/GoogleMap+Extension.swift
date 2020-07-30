//
//  GoogleMap+Extension.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/28/20.
//

import Foundation
import GoogleMaps

public extension GMSMapView {
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 500) {
        let zoomValue = GMSCameraPosition.zoom(at: location.coordinate, forMeters: regionRadius, perPoints: 200.0)
        let coordinateRegion = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: zoomValue)
        self.animate(to: coordinateRegion)
    }
}
