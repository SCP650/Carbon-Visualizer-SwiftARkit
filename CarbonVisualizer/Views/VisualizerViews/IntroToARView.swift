//
//  IntroToARView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/5/22.
//

import SwiftUI

struct IntroToARView: View {
    @ObservedObject var viewModel : CalculatorViewModel
    
    var body: some View {
        VStack{
            Text(viewModel.resultDailyKg)
            Button( action: {}, label: {
                NavigationLink(destination: VisualizerView(kgOfCo2: Float(viewModel.resultDailyKg)!)) {
                Text("Call to action")
                }
        })
        }
        
        
    }
}

struct IntroToARView_Previews: PreviewProvider {
    static var previews: some View {
        IntroToARView(viewModel: CalculatorViewModel())
    }
}
