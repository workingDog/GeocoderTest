//
//  ContentView.swift
//  GeocoderTest
//
//

import Foundation
import SwiftUI
import CoreLocation

struct ContentView: View {
    @State var txt = ""
    
    var body: some View {
        Text(txt)
            .onAppear {
                getLatLong()
            }
    }
    
    func getLatLong() {
        let address = "1850, Av. angamos este, Municipalidad Metropolitana de Lima, Surquillo, PERU"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if error == nil {
                print("\n---> placemarks: \(placemarks)\n")
                if let first = placemarks?.first,
                   let coord = first.location?.coordinate {
                    txt = "lat: \(coord.latitude)  lon: \(coord.longitude)"
                }
            } else {
                print("\n---> error: \(error)\n")
            }
        }
    }
}
