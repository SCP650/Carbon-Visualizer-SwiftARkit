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
    @State private var showingCarPopover = false
    @State private var showingMilesPopover = false
    @State private var showingMileagePopover = false
    @State private var showingWastePopover = false
    @State private var showingResultPopover = false
    
    
    func hideKeyboard() {
          UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
    
    var body: some View {
        Form {
            Section(){
       
                HStack{
                    TextField(viewModel.countPeople, text: $viewModel.countPeople).keyboardType(.numberPad).onTapGesture {
                        self.hideKeyboard()
                    }.multilineTextAlignment(.center)
                    Text("peep unit")
                }
            } header:{
                Text("peep size")
            } footer:{
                Text("peep count")
            }
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
                         Text("Natural Gas Assumption").padding()
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
                         Text("Electricity Assumption").padding()
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
                         Text("Fuel Oil Assumption").padding()
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
                   Button(action: {showingPropanePopover = true}) {
                       Image(systemName: "info.circle")
                     }
                     .popover(isPresented: $showingPropanePopover) {
                         Text("Explan Propane")
                             .font(.headline)
                             .padding()
                         Text("Propane Assumption").padding()
                     }
               }
           } header : {
               Text("Home Energy")
           }
            footer : {
               Text("Explain Home Energy")
           }
            //Transportation
            Section(){
                HStack{
                    Text("Car Count").frame(width: 80, alignment: .leading)
                    TextField(viewModel.carCount, text: $viewModel.carCount).keyboardType(.numberPad).onTapGesture {
                        self.hideKeyboard()
                     }.multilineTextAlignment(.center)
                    Text("Car Unit")
                    Button(action: {showingCarPopover = true}) {
                        Image(systemName: "info.circle")
                      }
                      .popover(isPresented: $showingCarPopover) {
                          Text("Explan Car")
                              .font(.headline)
                              .padding()
                      }
                }
                HStack{
                    Text("Miles driven").frame(width: 80, alignment: .leading)
                    TextField(viewModel.carMiles, text: $viewModel.carMiles).keyboardType(.decimalPad).onTapGesture {
                        self.hideKeyboard()
                     }.multilineTextAlignment(.center)
                    Text("Miles Unit")
                    Button(action: {showingMilesPopover = true}) {
                        Image(systemName: "info.circle")
                      }
                      .popover(isPresented: $showingMilesPopover) {
                          Text("Explan Miles")
                              .font(.headline)
                              .padding()
                      }
                }
                HStack{
                    Text("gas mileage").frame(width: 70, alignment: .leading)
                    TextField(viewModel.carMilage, text: $viewModel.carMilage).keyboardType(.decimalPad).onTapGesture {
                        self.hideKeyboard()
                     }.multilineTextAlignment(.center)
                    Text("Mileage Unit")
                    Button(action: {showingMileagePopover = true}) {
                        Image(systemName: "info.circle")
                      }
                      .popover(isPresented: $showingMileagePopover) {
                          Text("Explan Mileage")
                              .font(.headline)
                              .padding()
                      }
                }
            } header : {
                Text("Transportation")
            } footer:{
                Text("Explain Transportation")
            }
            
            Section(){
                HStack{
                    Text("waste unit")
                    Spacer()
                    Text(viewModel.wasteVal).foregroundColor(Color(UIColor.placeholderText))
                    Spacer()
                    Text("lb")
                    Button(action: {showingWastePopover = true}) {
                        Image(systemName: "info.circle")
                    }
                      .popover(isPresented: $showingWastePopover) {
                          Text("Explan Waste")
                              .font(.headline)
                              .padding()
                      }
                }
            } header:{
                Text("waste")
            }
        
            Section(){
                HStack{
                    Spacer()
                    Text(viewModel.result).bold()
                    Text("tons").bold()
                    Spacer()
                    Button(action: {showingResultPopover = true}) {
                        Image(systemName: "info.circle")
                    }
                      .popover(isPresented: $showingResultPopover) {
                          Text("Explan Result")
                              .padding()
                      }
                }
            }header: {
                Text("Your Annual CO2 emissions")
            } footer:{
                Text("Daily Consume \(viewModel.resultDailyKg)")
            }
            
            Section {
            Button(action: {
                viewRouter.currentPage = Page.visualize
            }) {
                Text("Call to action")
            }
        }
      
        }.onAppear(){
            viewModel.CalcCarbon()
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
