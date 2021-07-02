//
//  ContentView.swift
//  Currency converter
//
//  Created by Remon on 30/06/2021.
//

import SwiftUI

struct CurrencyListView: View {
    
    @StateObject var viewModel = CurrencyListViewModel()

    var body: some View {
        NavigationView{
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                
                // base currency view
                VStack{
                    
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [Color("Blue"), Color("DarkBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .ignoresSafeArea()
                            .frame(height: UIScreen.main.bounds.height * 0.3)
                        
                        VStack{
                            if viewModel.currency != nil {
                                
                                Text("\(viewModel.currency!.base.flag())")
                                    .font(Font.system(size: 100))

                                Text(viewModel.currency!.base)
                                    .foregroundColor(.white)
                                    .font(.custom("Roboto-Bold", size: Constants.largeFontSize))
                                
                            }
                            Spacer().frame( height: 35)
                        }
                    }
                    Spacer()
                    Color.white
                }
                
                // currency rates list
                VStack{
                    if viewModel.currency != nil{
                        ScrollView{
                            LazyVStack{
                                
                                ForEach(viewModel.currency!.rates.sorted(by: <), id: \.key) { key, value in
                                    
                                    NavigationLink( destination: CurrencyCalculateView(key: key, value: value, viewModel: viewModel)){
                                        CurrencyCell(key: key, value: value)
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                }.offset(y: UIScreen.main.bounds.height / 3 - 60) // list position
                .padding(.bottom, UIScreen.main.bounds.height / 3 - 55)
                
                if viewModel.isApiLoading{
                    ZStack(){
                        Color(.systemBackground).ignoresSafeArea().opacity(0.2)
                        ProgressView().progressViewStyle(CircularProgressViewStyle.init(tint: .gray)).scaleEffect(2)
                    }
                }
                
            }).navigationBarHidden(true)
            
        }.alert(isPresented: $viewModel.errorExist, content: {
            Alert(title: Text("Alert"), message: Text("\(viewModel.errorMessage)"), dismissButton: .cancel())
        })
        .accentColor(.white)
        .onAppear(){
            viewModel.fetchCurrencyRates()
        }
    }
}

struct CurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView()
    }
}
