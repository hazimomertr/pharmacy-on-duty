import Foundation
import SwiftUI

import Foundation
import SwiftUI

struct HeaderView: View {
    var title: String
    var showBackButton: Bool = false
    var showLogo: Bool = false

    @Environment(\.presentationMode) var presentationMode // Access the presentation mode
    
    var body: some View {
        HStack {
            if showBackButton {
                CustomBackButton(color: AppColors.textPrimary, presentationMode: presentationMode)
            }
            
            Spacer()
            
            HStack {
                if showLogo {
                    Image("app_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                }
                
                
                Text(title)
                    .font(.system(size: 24).bold())
                    .foregroundColor(AppColors.textPrimary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            Spacer()
            
            if showBackButton {
                Spacer().frame(width: 44)
            }
        }
        .padding(.top, 50.0)
        .padding(.bottom, 10)
        .background(AppColors.primary)
        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(AppColors.overlayColor, lineWidth: 2)
        )
        .shadow(color: AppColors.shadowColor, radius: 10, x: 0, y: 5)
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

