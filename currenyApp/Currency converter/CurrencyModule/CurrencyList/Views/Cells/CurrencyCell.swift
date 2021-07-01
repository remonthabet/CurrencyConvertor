//
//  CurrencyCell.swift
//  Currency converter
//
//  Created by Remon on 30/06/2021.
//

import SwiftUI

struct CurrencyCell: View {
    var key : String
    var value : Double
    var body: some View {
        
        ZStack{
            Color.white
            HStack{
                Text("\(key.flag())")
                    .font(Font.system(size: 40))

                Text(key)
                    .foregroundColor(.black)
                    .font(Font.headline.weight(.bold))
                    .font(.custom("Roboto-Bold", size: Constants.MediumFontSize))

                Spacer()
                
                Text(String(format:"\(Constants.fractionRound)", value))
                    .foregroundColor(.black)
                    .font(.custom("Roboto-Regular", size: Constants.MediumFontSize))

            }.padding()
        }.frame(width: UIScreen.main.bounds.width - 50, height: 80) // cell size
        .shadow(color: .gray, radius: 2)

          
    }
}

struct CurrencyCell_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyCell(key: "", value: 0)
    }
}
