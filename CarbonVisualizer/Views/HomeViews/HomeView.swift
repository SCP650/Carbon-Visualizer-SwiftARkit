//
//  HomeView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/3/22.
//

import SwiftUI
//redo home view base on this https://www.youtube.com/watch?v=EBbhIbI2Hg8

struct HomeView: View {
    let viewModel = CalculatorViewModel()
    var body: some View {
        NavigationView{
            VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:25){
                   
                    GeometryReader{ geometry in
                        CalcCardView(viewModel: viewModel)
                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40)/20), axis: (x: 0, y: 10, z: 0))
                    }.frame(width: 250, height: 500)
                    
       
                    GeometryReader{ geometry in
                        ARCardView(viewModel:viewModel).rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40)/20), axis: (x: 0, y: 10, z: 0))
                    }.frame(width: 250, height: 500)
                    
     
                    GeometryReader{ geometry in
                        LearnMoreCardView().rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40)/20), axis: (x: 0, y: 10, z: 0))
                    }.frame(width: 250, height: 500)
                    Spacer()
                }
                
            }
                Text("Made by Sebastian Yang").font(.footnote).frame(alignment: .center).foregroundColor(Color(UIColor.placeholderText)).padding()
                
            }.navigationBarTitle("Title").frame(width: UIScreen.main.bounds.width, height: 700)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
