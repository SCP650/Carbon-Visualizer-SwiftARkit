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
            ScrollView {
            VStack{
                //First button
                   NavigationLink( destination: CalculatorView()){
                       HStack{
                       Text("Calculate")
                               .fontWeight(.medium)
                               .frame(width: 150, height:150, alignment: .center)
                       Image(systemName: "person.crop.circle.fill.badge.plus")
                           .foregroundColor((Color(UIColor.systemBlue)))
                           .font(.system(size: 70.0))
                           .padding()
                           .frame(width: 150, height:150, alignment: .center)
                     
                       }.frame(width: 300, height:150, alignment: .center)
                           .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                                           .accentColor(Color(UIColor.systemGray5))
                           )
                           .padding()
                   }
                
                //Second button
                   NavigationLink( destination: VisualizerView()){
                       HStack{
                       Text("Calculate")
                               .fontWeight(.medium)
                               .frame(width: 150, height:150, alignment: .center)
                       Image(systemName: "person.crop.circle.fill.badge.plus")
                           .foregroundColor((Color(UIColor.systemBlue)))
                           .font(.system(size: 70.0))
                           .padding()
                           .frame(width: 150, height:150, alignment: .center)
                     
                       }.frame(width: 300, height:150, alignment: .center)
                           .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                                           .accentColor(Color(UIColor.systemGray5))
                           )
                   } .padding()
                
                //Third button
                   NavigationLink( destination: LearnMoreView()){
                       HStack{
                       Text("Calculate")
                               .fontWeight(.medium)
                               .frame(width: 150, height:150, alignment: .center)
                       Image(systemName: "person.crop.circle.fill.badge.plus")
                           .foregroundColor((Color(UIColor.systemBlue)))
                           .font(.system(size: 70.0))
                           .padding()
                           .frame(width: 150, height:150, alignment: .center)
                     
                       }.frame(width: 300, height:150, alignment: .center)
                           .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                                           .accentColor(Color(UIColor.systemGray5))
                           )
                   } .padding()
                Spacer()
                  
            }
                
            }.navigationBarTitle("Carbon")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
