//
//  SearchButton.swift
//  eczane
//
//  Created by hazem omer on 17.05.2024.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    @Binding var isLoading: Bool
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(AppColors.buttonText)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(AppColors.primary)
                    .cornerRadius(16)

                if isLoading {
                    ProgressView()
                        .scaleEffect(1.5, anchor: .center)
                }
            }
        }
        .disabled(isLoading)
        .shadow(color: AppColors.textSecondary.opacity(0.6), radius: 10, x: 0, y: 5)
    }
}

struct CustomButton_Previews: PreviewProvider {
    @State static var isLoading = false

    static var previews: some View {
        CustomButton(title: "Search", isLoading: $isLoading, action: {
            print("Button tapped")
        })
        .padding() // Added padding for preview
    }
}
