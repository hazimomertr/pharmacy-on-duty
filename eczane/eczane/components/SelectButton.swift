//
//  SelectButton.swift
//  eczane
//
//  Created by hazem omer on 22.05.2024.
//

import Foundation

import SwiftUI



struct SelectButton: View {
    var district: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(district)
                    .font(.system(size: 18))
                    .foregroundColor(AppColors.textPrimary)
                    .multilineTextAlignment(.leading)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(AppColors.textPrimary)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isSelected ? AppColors.primary : Color.clear)
            .cornerRadius(10)
        }
    }
}

