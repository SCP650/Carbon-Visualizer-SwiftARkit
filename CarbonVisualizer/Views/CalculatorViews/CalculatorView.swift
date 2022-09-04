//
//  CalculatorView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/3/22.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel = CalculatorViewModel()
    @State var username: String = ""
      @State var isPrivate: Bool = true
      @State private var previewIndex = 0
    
    @State private var showingPopover = false
    
    func hideKeyboard() {
          UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
    
    var body: some View {
        Form {
           Section() {
               HStack{
                   TextField("Username", text: $viewModel.naturalGasVal).keyboardType(.decimalPad).onTapGesture {
                       self.hideKeyboard()
                    }
                   Button(action: {showingPopover = true}) {
                       Image(systemName: "info.circle")
    
                     }
                     .popover(isPresented: $showingPopover) {
                         Text("Explan Natural Gas")
                             .font(.headline)
                             .padding()
                         Text("Natural Gas Assumption")
                     }
               }
               Picker("Unit", selection: $viewModel.gasUnit) {
                   Text(gasUnits.dollars.rawValue).tag(gasUnits.dollars)
                   Text(gasUnits.cubeFeet.rawValue).tag(gasUnits.cubeFeet)
               }
           } header : {
               Text("Natural Gas")
           }
            footer : {
               Text("Explain Home Energy")
           }
        
           
           Section(header: Text("ABOUT")) {
               HStack {
                   Text("Version")
                   Spacer()
                   Text("2.2.1")
               }
           }
           
           Section {
               Button(action: {
                   print("Perform an action here...")
               }) {
                   Text("Reset All Settings")
               }
           }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
