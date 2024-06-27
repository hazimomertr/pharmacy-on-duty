//
//  DistrictSelectionView.swift
//  eczane
//
//  Created by hazem omer on 22.05.2024.
//

import Foundation
import SwiftUI

struct DistrictSelectionView: View {
    @Binding var selectedDistrict: String?
    
    let districts = [
        "Tüm İlçeler",
        "Merkez",
        "Enez",
        "Havsa",
        "İpsala",
        "Keşan",
        "Lalapaşa",
        "Meriç",
        "Süloğlu",
        "Uzunköprü",
    ]
    
    let tags = [
        "il",
        "merkez",
        "enez",
        "havsa",
        "ipsala",
        "kesan",
        "lalapasa",
        "meric",
        "suloglu",
        "uzunkopru",
    ]
    
    var body: some View {
        VStack {
            HeaderView(title: "İlçe Seç", showBackButton: true)
            
            Spacer().frame(height: 20)
            
            ForEach(districts.indices, id: \.self) { index in
                SelectButton(
                    district: districts[index],
                    isSelected: selectedDistrict == tags[index],
                    action: { selectedDistrict = tags[index] }
                )
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .background(AppColors.background)
    }
}
struct DistrictSelectionView_Previews: PreviewProvider {
    @State static var selectedDistrict: String? = "il"
    
    static var previews: some View {
        DistrictSelectionView(selectedDistrict: $selectedDistrict)
    }
}
