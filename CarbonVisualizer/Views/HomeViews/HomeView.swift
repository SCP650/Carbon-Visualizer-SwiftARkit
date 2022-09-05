//
//  HomeView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/3/22.
//

import SwiftUI
//redo home view base on this https://www.youtube.com/watch?v=EBbhIbI2Hg8

struct HomeView: View {
    var body: some View {
        NavigationView{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:25){
                   
                    GeometryReader{ geometry in
                        CardView().rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40)/20), axis: (x: 0, y: 10, z: 0))
                    }.frame(width: 250, height: 500)
                    
       
                    GeometryReader{ geometry in
                        CardView().rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40)/20), axis: (x: 0, y: 10, z: 0))
                    }.frame(width: 250, height: 500)
                    
     
                    GeometryReader{ geometry in
                        CardView().rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40)/20), axis: (x: 0, y: 10, z: 0))
                    }.frame(width: 250, height: 500)
                    Spacer()
                }
                
            }.navigationBarTitle("Carbon").frame(width: UIScreen.main.bounds.width, height: 700)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
