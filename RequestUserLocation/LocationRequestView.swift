//
//  LocationRequestView.swift
//  RequestUserLocation
//
//  Created by Muhammad Zeeshan on 20/08/2024.
//

import SwiftUI

struct LocationRequestView: View {
    
    var body: some View{
    ZStack {
        Color.blue
            .ignoresSafeArea()
        
        VStack {
            Spacer()
            
            Image(systemName: "paperplane.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .padding(.bottom, 32)
            
            Text("Would you like to explore places nearby?")
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Start Sharing your location with us")
                .multilineTextAlignment(.center)
                .frame(width: 140)
                .padding()
            
            Spacer()
            
            VStack {
                Button(action: {
                    LocationManager.shared.requestLocation()
                    print("Request location from user")
                }, label: {
                    Text("Allow Location")
                        .padding()
                        .font(.headline)
                        .foregroundStyle(Color.blue)
                })
                .frame(width: UIScreen.main.bounds.width)
                .padding(.horizontal, -32)
                .background(Color.white)
                .clipShape(Capsule())
                .padding()
                
                Button(action: {
                    print("Dismiss")
                }, label: {
                    Text("Maybe later")
                        .padding()
                        .font(.headline)
                        .foregroundStyle(.white)
                })
            }
            .padding(.bottom, 32)
        }
        .foregroundStyle(Color.white)
    }
}
}

#Preview {
    LocationRequestView()
}
