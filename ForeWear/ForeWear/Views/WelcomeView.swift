//
//  WelcomeView.swift
//  ForeWear
//
//  Created by Valeria Guardascione on 09/12/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                // Welcome Title
                Text("Welcome to ForeWear")
                    .bold()
                    .font(.title)
                    .accessibilityAddTraits(.isHeader) // Indicates a header for better navigation
                
                // Instructional Text
                Text("Please share your current location to get ForeWear in your area")
                    .padding()
                    .accessibilityLabel("Please share your current location to receive ForeWear updates in your area.")
                
                // Location Sharing Button
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
                .accessibilityLabel("Share Current Location") // Descriptive label
                .accessibilityHint("Tap to share your current location and receive ForeWear updates in your area.")
                .accessibilityAddTraits(.isButton) // Ensures VoiceOver recognizes it as a button
            }
            .multilineTextAlignment(.center)
            .padding()
            .accessibilityElement(children: .contain) // Groups the VStack elements into a single accessible element
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground)) // Ensures proper contrast
        .ignoresSafeArea() // Adjust based on your design needs
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(LocationManager()) // Provide a mock environment object for previews
    }
}
