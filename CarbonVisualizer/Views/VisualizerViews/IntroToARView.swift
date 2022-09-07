//
//  IntroToARView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/5/22.
//

import SwiftUI

struct IntroToARView: View {
    @ObservedObject var viewModel : CalculatorViewModel
    @State var showInfo : Bool = false
    func hideKeyboard() {
          UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
    var body: some View {
        VStack{
            Spacer()
            Text("Your Daily Emission is...").font(.title)
            HStack{
            TextField("",
                      text: $viewModel.resultDailyKg
                  )
                  .textFieldStyle(.roundedBorder)
                  .keyboardType(.decimalPad)
                .frame(width: 200, height: 30, alignment: .center)
                Text("kg")
                Button(action: { showInfo = true}) {
                    Image(systemName: "questionmark.circle")
                }
                  .popover(isPresented: $showInfo) {
                      Text("Explan Daily Result")
                          .padding()
                  }
            }
            Spacer()
            Button( action: {}, label: {
                NavigationLink(destination: VisualizerView(kgOfCo2: Float(viewModel.resultDailyKg) ?? 0)) {
                Text("Call to action")
                }
        })
            Spacer()
        }.onTapGesture {
            hideKeyboard()
        }
        
        
    }
}

struct IntroToARView_Previews: PreviewProvider {
    static var previews: some View {
        IntroToARView(viewModel: CalculatorViewModel())
    }
}
