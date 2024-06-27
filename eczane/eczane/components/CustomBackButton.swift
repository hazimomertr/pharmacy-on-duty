//
//  CustomBackButton.swift
//  eczane
//
//  Created by hazem omer on 22.05.2024.
//

import Foundation
import SwiftUI

struct CustomBackButton: View {
    var color: Color
    var presentationMode: Binding<PresentationMode> // Binding to presentation mode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss() // Dismiss the view using presentation mode
        }) {
            Image(systemName: "chevron.backward")
                .foregroundColor(color) // Set the color of the back button
                .font(.title)
                .padding(.horizontal, 20)
        }
    }
}
