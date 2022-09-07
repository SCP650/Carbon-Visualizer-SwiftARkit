//
//  VisualizerView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/3/22.
//

import SwiftUI

struct VisualizerView: View {
    @State private var placeObject = false
    @State public var kgOfCo2 : Float = 24.48
    var body: some View {
        ZStack(alignment: .bottom){ ARViewContainer(triggerObject:self.$placeObject, kgOfCo2: self.$kgOfCo2).edgesIgnoringSafeArea(.all)
            VStack{
                Button(placeObject ? "Reset":"Visualize"){
                    placeObject = !placeObject
                }.padding()
                    .background(Color(UIColor.tintColor))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                Text("Visualizing \(kgOfCo2) kg of CO2").frame(alignment:.center)
            }.padding()
        }
    }
}

