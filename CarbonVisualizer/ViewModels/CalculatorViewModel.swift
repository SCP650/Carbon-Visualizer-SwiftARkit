//
//  CalculatorViewModel.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/4/22.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var naturalGasVal : String = "23.0"
    @Published var gasUnit : gasUnits = gasUnits.dollars
    @Published var electricVal : String = "44.0"
    @Published var elecUnit : electricUnits = electricUnits.dollars
    @Published var fuelVal : String = "72.0"
    @Published var fuelUnit : fuelUnits = fuelUnits.dollars
    @Published var propaneVal : String = "37.0"
    @Published var propaneUnit : propaneUnits = propaneUnits.dollars
    
    @Published var result : String = "123"
    
}

enum gasUnits: String {
    case dollars = "Dollars"
    case cubeFeet = "Thousand Cube Feet"
}

enum electricUnits: String {
    case dollars = "Dollars"
    case watt = "kWh"
}

enum fuelUnits: String {
    case dollars = "Dollars"
    case gallon = "Gallons"
}

enum propaneUnits: String {
    case dollars = "Dollars"
    case gallon = "Gallons"
}
