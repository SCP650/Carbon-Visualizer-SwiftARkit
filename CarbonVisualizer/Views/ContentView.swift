//
//  ContentView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/2/22.
//

import SwiftUI


struct ContentView : View {

    var body: some View {
        VisualizerView()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
