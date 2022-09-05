//
//  CalculatorView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/3/22.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel = CalculatorViewModel()
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var showingGasPopover = false
    @State private var showingElectricPopover = false
    @State private var showingFuelPopover = false
    @State private var showingPropanePopover = false
    
    func hideKeyboard() {
          UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
    
    var body: some View {
        Form {
           Section() {
               //Natural Gas
               HStack{
                   Text("Natural Gas")
                   TextField(viewModel.naturalGasVal, text: $viewModel.naturalGasVal).keyboardType(.decimalPad).onTapGesture {
                       self.hideKeyboard()
                   }.multilineTextAlignment(.center)
                   Picker("Unit", selection: $viewModel.gasUnit) {
                       Text(gasUnits.dollars.rawValue).tag(gasUnits.dollars)
                       Text(gasUnits.cubeFeet.rawValue).tag(gasUnits.cubeFeet)
                   }.pickerStyle(.menu)
                   Button(action: {showingGasPopover = true}) {
                       Image(systemName: "info.circle")
                     }
                     .popover(isPresented: $showingGasPopover) {
                         Text("Explan Natural Gas")
                             .font(.headline)
                             .padding()
                         Text("Natural Gas Assumption")
                     }
               }
               //Electricity
               HStack{
                   Text("Electricity")
                   TextField(viewModel.electricVal, text: $viewModel.electricVal).keyboardType(.decimalPad).onTapGesture {
                       self.hideKeyboard()
                    }.multilineTextAlignment(.center)
                   Picker("Unit", selection: $viewModel.elecUnit) {
                       Text(electricUnits.dollars.rawValue).tag(electricUnits.dollars)
                       Text(electricUnits.watt.rawValue).tag(electricUnits.watt)
                   }.pickerStyle(.menu)
                   Button(action: {showingElectricPopover = true}) {
                       Image(systemName: "info.circle")
                     }
                     .popover(isPresented: $showingElectricPopover) {
                         Text("Explan Electricity")
                             .font(.headline)
                             .padding()
                         Text("Electricity Assumption")
                     }
               }
               //Fuel Oil
               HStack{
                   Text("Fuel Oil")
                   TextField(viewModel.fuelVal, text: $viewModel.fuelVal).keyboardType(.decimalPad).onTapGesture {
                       self.hideKeyboard()
                    }.multilineTextAlignment(.center)
                   Picker("Unit", selection: $viewModel.fuelUnit) {
                       Text(fuelUnits.dollars.rawValue).tag(fuelUnits.dollars)
                       Text(fuelUnits.gallon.rawValue).tag(fuelUnits.gallon)
                   }.pickerStyle(.menu)
                   Button(action: {showingFuelPopover = true}) {
                       Image(systemName: "info.circle")
                     }
                     .popover(isPresented: $showingFuelPopover) {
                         Text("Explan Fuel Oil")
                             .font(.headline)
                             .padding()
                         Text("Fuel Oil Assumption")
                     }
               }
               //Propane
               HStack{
                   Text("Propane")
                   TextField(viewModel.propaneVal, text: $viewModel.propaneVal).keyboardType(.decimalPad).onTapGesture {
                       self.hideKeyboard()
                    }.multilineTextAlignment(.center) 
                   Picker("Unit", selection: $viewModel.propaneUnit) {
                       Text(propaneUnits.dollars.rawValue).tag(propaneUnits.dollars)
                       Text(propaneUnits.gallon.rawValue).tag(propaneUnits.gallon)
                   }.pickerStyle(.menu)
                   Button(action: {showingFuelPopover = true}) {
                       Image(systemName: "info.circle")
                     }
                     .popover(isPresented: $showingFuelPopover) {
                         Text("Explan Propane")
                             .font(.headline)
                             .padding()
                         Text("Propane Assumption")
                     }
               }
           } header : {
               Text("Home Energy")
           }
            footer : {
               Text("Explain Home Energy")
           }
            
            Section(){
                Text("1924234")
            }header: {
                Text("Annual CO2 emissions")
            } footer:{
                Text("Average U.S CO2 footprint is 16 ton per year. ")
            }
            
            Section {
            Button(action: {
                viewRouter.currentPage = Page.visualize
            }) {
                Text("Visualize CO2 footprint in AR")
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
