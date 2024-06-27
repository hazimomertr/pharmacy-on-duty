//
//  TextComponents.swift
//  eczane
//
//  Created by hazem omer on 22.05.2024.
//

import Foundation
import SwiftUI

struct InfoTextView: View {
    let text: String

    var body: some View {
       
            Text(text)
                .font(.system(size: 18))
                .foregroundColor(AppColors.textSecondary.opacity(0.9))
                .padding(.init(top: 10, leading: 20, bottom: 20, trailing: 20))
                .cornerRadius(8)
    }
}

struct SectionTitleView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.system(size: 22).bold())
            .foregroundColor(AppColors.textPrimary)
            
    }
}

struct TextWithIconRowView: View {
    let iconName: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(AppColors.iconColor)
            Text(text)
                .font(.subheadline)
                .foregroundColor(AppColors.textPrimary)
        }
    }
}
