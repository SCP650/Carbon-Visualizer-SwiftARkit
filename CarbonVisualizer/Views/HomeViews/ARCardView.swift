//
//  CardView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/5/22.
//

import SwiftUI

struct ARCardView: View {
    @ObservedObject var viewModel : CalculatorViewModel
    var body: some View {
        //First button
        NavigationLink( destination: IntroToARView(viewModel: viewModel)){
               VStack{
                   Spacer()
               Text("Visulize In AR")
                       .fontWeight(.bold)
                       .foregroundColor(Color(UIColor.label))
                       .multilineTextAlignment(.leading)
                       .frame(width: 200, height:60, alignment: .leading )
                   Spacer()
               Image(systemName: "person.crop.circle.fill.badge.plus")
                   .foregroundColor((Color(UIColor.systemBlue)))
                   .padding()
                   .frame(width: 200, height:200,alignment: .center)
                   Spacer()
               }.frame(width: 250, height: 400, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                                   .accentColor(Color(UIColor.secondarySystemBackground))
                   )
                   .padding()
        }
    }
}

struct Previews_ARCardView_Previews: PreviewProvider {
    static var previews: some View {
        ARCardView(viewModel: CalculatorViewModel())
    }
}
