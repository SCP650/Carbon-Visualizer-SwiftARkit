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
}

enum gasUnits: String {
    case dollars = "Dollars"
    case cubeFeet = "Thousand Cube Feat"
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
