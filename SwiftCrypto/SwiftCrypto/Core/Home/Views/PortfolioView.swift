//
//  PortfolioView.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 26/12/2565 BE.
//

import SwiftUI

struct PortfolioView: View {
    // MARK: - PROPERTY
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }//: VSTACK
            }//: SCROLLVIEW
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(presentationMode: presentationMode)
                }//:TOOL BAR ITEM
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }//:TOOL BAR ITEM
                
            })//: TOOL BAR
        }//: NAVIGATION VIEW
        
    }
}


extension PortfolioView {
    
    // MARK: - coinLogoList
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                selectedCoin = coin
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )//: BACKGROUND
                }//: LOOP
            }//: LazyHStack
            .frame(height: 120)
            .padding(.leading)
            
        }//: SCROLLVIEW
    }
    
    // MARK: - getCurrentValue
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        
        return 0
    }
    
    // MARK: - portfolioInputSection
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Cuttent price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                
                Text(selectedCoin?.currentPrice?.asCurrencyWith6Decimals() ?? "")
                
            }//: HSTACK
            
            Divider()
            
            HStack {
                
                Text("Amount holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
                
            }//: HSTACK
            Divider()
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }//: HSTACK
            
        }//: VSTACK
        .animation(nil, value: UUID())
        .padding()
        .font(.headline)
    }
    
    // MARK: - trailingNavBarButtons
    private var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0
            )

            
        }//: HSTACK
        .font(.headline)
    }
    
    private func saveButtonPressed() {
        guard let coin = selectedCoin else { return }
        
        // save to portfolio
        
        
        // show checkmark
        withAnimation(.easeIn) {
            showCheckmark = true
            removeSelectedCoin()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
}

// MARK: - PREVIEW
struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}
