import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedDistrict: String? = nil
    @State private var pharmacies: [Pharmacy] = []
    @State private var isLoading: Bool = false
    @State private var isShowingDetail: Bool? = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                /// App Bar component
                HeaderView(title: "PharmaConnect",showLogo: true)
                
                Spacer().frame(height: 20)
                /// Section Title component
                HStack{
                    SectionTitleView(title: "Eczane Arama")
                    Spacer()
                }.padding(.horizontal,20)
                
                /// Info Text component
                HStack{
                    InfoTextView(text: "Bu hizmeti kullanarak seçtiğiniz Edirne ilçesindeki nöbetçi eczane bilgilerine ulaşabilirsiniz.")
                    Spacer()
                }
                
                Spacer().frame(height: 20)
                HStack{
                    Text("*")
                        .font(.title)
                        .foregroundColor(Color.red)
                    Text("İlçe Seçimi")
                        .font(.system(size: 18))
                        .foregroundColor(AppColors.textPrimary)
                    Spacer()
                }.padding(.horizontal,20)
               
                // Navigation button to the DistrictSelectionView with arrow icon
                NavigationLink(destination: DistrictSelectionView(selectedDistrict: $selectedDistrict)) {
                      HStack {
                          if let selectedDistrict = selectedDistrict {
                              Text(selectedDistrict == "il" ? "Tüm İlçeler" : selectedDistrict.capitalized)
                                  .font(.headline)
                          } else {
                              Text("Seçiniz")
                                  .foregroundColor(AppColors.textSecondary)
                                  .font(.headline)
                          }
                          Spacer()
                          
                              Image(systemName: "chevron.right")
                                  .font(.headline)
                      }
                      .foregroundColor(AppColors.buttonText)
                      .padding()
                      .padding(.vertical, 10)
                      .background(AppColors.background2)
                      .cornerRadius(16)
                      .overlay(
                          RoundedRectangle(cornerRadius: 16)
                              .stroke(AppColors.buttonBorder, lineWidth: 1)
                      )
                  }
                  .padding(.horizontal, 20)
                
                Spacer().frame(height: 20)
                
                /// Search Button component
                    NavigationLink(
                        destination: PharmacyListView(pharmacies: pharmacies),
                        tag: true,
                        selection: $isShowingDetail,
                        label: {
                            CustomButton(title: "Ara",isLoading: $isLoading, action: {
                                if selectedDistrict == nil {
                                    alertMessage = "Lütfen bir ilçe seçin."
                                    showAlert = true
                                } else {
                                    fetchPharmacies(for: selectedDistrict!)
                                }
                            }
                            )
                        }
                    ).padding(.horizontal, 20)
                
                Spacer().frame(height: 20)
                Spacer()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Uyarı"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(false)
            .background(AppColors.background)
        }
    }
    
    func fetchPharmacies(for district: String) {
        isLoading = true
        APIService.fetchPharmacies(for: district) { result in
            isLoading = false
            switch result {
            case .success(let pharmacies):
                self.pharmacies = pharmacies
                self.isShowingDetail = true
            case .failure(let error):
                self.alertMessage = "Error fetching pharmacies: \(error.localizedDescription)"
                self.showAlert = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
