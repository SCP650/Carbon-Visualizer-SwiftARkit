//
//  LearnMoreView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/3/22.
//

import SwiftUI

struct LearnMoreView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack{
                Text("Learn More Text").padding()
                Text("")
            }
        }
    }
}

struct LearnMoreView_Previews: PreviewProvider {
    static var previews: some View {
        LearnMoreView()
    }
}
