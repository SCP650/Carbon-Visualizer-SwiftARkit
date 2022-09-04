//
//  ContentView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/2/22.
//

import SwiftUI


struct ContentView : View {
    @State private var placeObject = false
    @State private var kgOfCo2 : Float = 24.48
    var body: some View {
        VStack{ ARViewContainer(triggerObject:self.$placeObject, kgOfCo2: self.$kgOfCo2).edgesIgnoringSafeArea(.all)
            HStack{
                Button(placeObject ? "Reset":"Visualize"){
                    placeObject = !placeObject
                }
                TextField("Kg of Co2", value: self.$kgOfCo2, formatter: NumberFormatter())
            }
       
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
