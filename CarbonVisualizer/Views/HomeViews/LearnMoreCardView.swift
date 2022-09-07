//
//  LearnMoreCardView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/6/22.
//

import SwiftUI

struct LearnMoreCardView: View {
    private func calcxOffSet(inputX:CGFloat) -> CGFloat{
        let res = -1*inputX/10 + 7
        return min(max(res,-10),10)
    }
    var body: some View {
        //First button
        NavigationLink( destination: LearnMoreView()){
               VStack{
                   Spacer()
               Text("Learn More")
                       .font(.title2)
                       .fontWeight(.bold)
                       .foregroundColor(Color(UIColor.label))
                       .multilineTextAlignment(.leading)
                       .frame(width: 200, height:60, alignment: .leading )
                   Spacer()
                   GeometryReader { geometry in
               Image("Earf")
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

struct LearnMoreCardView_Previews: PreviewProvider {
    static var previews: some View {
        LearnMoreCardView()
    }
}
