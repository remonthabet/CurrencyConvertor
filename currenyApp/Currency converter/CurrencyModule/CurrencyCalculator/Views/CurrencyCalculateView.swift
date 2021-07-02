//
//  CurrencyCell.swift
//  Currency converter
//
//  Created by Remon on 30/06/2021.
//

import SwiftUI

struct CurrencyCalculateView: View {
    
    var key : String
    var value : Double
    @StateObject var viewModel : CurrencyListViewModel
    @State var text = "1.00"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
            
            LinearGradient(gradient: Gradient(colors: [Color("Blue"), Color("DarkBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Spacer()
                    ZStack {
                        if text.isEmpty {
                            Text("\(text)").foregroundColor(.white)
                           }
                           TextField("", text: $text)
                            .foregroundColor(.white)
                            .keyboardType(.numberPad)
                            .font(.custom("Roboto-Bold", size: Constants.largeFontSize))
                       }
                    
                    Text("\(viewModel.currency!.base)")
                        .foregroundColor(.white)
                        .font(.custom("Roboto-Bold", size: Constants.largeFontSize))

                }.padding()
                
                VStack{
                    Color.white.frame(height:CGFloat(1) / UIScreen.main.scale)
                }
                
                HStack{
                    if text.count > 0{
                        Text("\(viewModel.calculateRate(value: Double(text.arToEnDigits)!, rate: value))")
                            .foregroundColor(.white)
                            .font(.custom("Roboto-Bold", size: Constants.largeFontSize))
                    }
                    Spacer()
                    Text("\(key)")
                        .foregroundColor(.white)
                        .font(.custom("Roboto-Bold", size: Constants.largeFontSize))
                }.padding()

            }

        })
   
    }
}

struct CurrencyCalculateView_Previews: PreviewProvider {
    @StateObject static var viewModel = CurrencyListViewModel()

    static var previews: some View {
        CurrencyCalculateView(key: "usd", value: 66, viewModel: viewModel)
    }
}
