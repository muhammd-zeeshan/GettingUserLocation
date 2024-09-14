//
//  ContentView.swift
//  RequestUserLocation
//
//  Created by Muhammad Zeeshan on 14/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                LocationRequestView()
            } else if let location = LocationManager.shared.userLocation{
                Text("\(location.coordinate)")
            }
        }
    }
}

#Preview {
    ContentView()
}
