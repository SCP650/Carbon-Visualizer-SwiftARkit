//
//  CardView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/5/22.
//

import SwiftUI

struct ARCardView: View {
    @ObservedObject var viewModel : CalculatorViewModel
    private func calcxOffSet(inputX:CGFloat) -> CGFloat{
        let res = -1*inputX/10 + 7
        return min(max(res,-10),10)
    }
    var body: some View {
        //First button
        NavigationLink( destination: IntroToARView(viewModel: viewModel)){
               VStack{
                   Spacer()
               Text("Visulize Your Emission In AR")
                       .font(.title2)
                       .fontWeight(.bold)
                       .foregroundColor(Color(UIColor.label))
                       .multilineTextAlignment(.leading)
                       .frame(width: 200, height:60, alignment: .leading )
                   Spacer()
                   GeometryReader { geometry in
               Image("cold-earf")
                   .resizable()
                   .scaledToFit()
                   .padding()
                   .shadow(
                    color: .black,
                           radius: CGFloat(5),
                           x: calcxOffSet( inputX: geometry.frame(in: .global).minX), y: CGFloat(20))
                       
                   }.frame(width: 220, height:220,alignment: .center)
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
