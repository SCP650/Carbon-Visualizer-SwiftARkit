//
//  CalculatorViewModel.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/4/22.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var naturalGasVal : String = "23.0"{
        didSet{
            CalcCarbon()
        }
    }
    @Published var gasUnit : gasUnits = gasUnits.dollars{didSet{CalcCarbon()}}
    @Published var electricVal : String = "44.0"{didSet{CalcCarbon()}}
    @Published var elecUnit : electricUnits = electricUnits.dollars{didSet{CalcCarbon()}}
    @Published var fuelVal : String = "72.0"{didSet{CalcCarbon()}}
    @Published var fuelUnit : fuelUnits = fuelUnits.dollars{didSet{CalcCarbon()}}
    @Published var propaneVal : String = "37.0"{didSet{CalcCarbon()}}
    @Published var propaneUnit : propaneUnits = propaneUnits.dollars{didSet{CalcCarbon()}}
    
    @Published var carCount : String = "1.88"{didSet{CalcCarbon()}}
    @Published var carMiles : String = "240" {didSet{CalcCarbon()}}
    @Published var carMilage : String = "21.4" {didSet{CalcCarbon()}}
    
    @Published var countPeople : String = "1" {didSet{CalcCarbon()}}
    @Published var wasteVal : String = "692"
    
    @Published var result : String = "123"
    @Published var resultDailyKg : String = "321"
    
    public func CalcCarbon(){
        var resultF = (calcNaturalGas() + calcElectricity() + calcFuel() + calcPropane() + calcCars() + calcWaste()) * 0.000453592 //convert from lb to ton
        if let countF = Float(countPeople){
            resultF /= countF //convert household to individual
        }
        result = String(round(resultF * 100) / 100.0)
        resultDailyKg = String(round((resultF/365.0) * 100000) / 100.0)
    }
    
    private func calcWaste() -> Float{
        if let numPep = Int(countPeople){
            wasteVal = String(numPep*692)
            return Float(numPep*692)
        }
        return 0.0
    }
    
    private func calcCars() -> Float{
        if let carCountInt = Float(carCount), var milesF = Float(carMiles), let milageF = Float(carMilage){
            milesF = milesF * 52 //miles per week -> miles per year
            return (carCountInt*milesF)/milageF*19.6//lbs CO2/gallon
        }
        return 0.0
    }
    
    private func calcNaturalGas() -> Float{
        if var gasValF = Float(naturalGasVal){
            if(gasUnit == gasUnits.dollars){
                gasValF = gasValF/1.04  //dollars/month/person
            }
            return gasValF*11.7*12//Emission factor (natural gas/therm) , lbs CO2/therm natural gas
        }
        return 0.0
    }
    
    private func calcElectricity()->Float{
        if var elecValF = Float(electricVal){
            if(elecUnit == electricUnits.dollars){
                elecValF = elecValF/0.1188
            }
            return elecValF*1.238*12
        }
        return 0.0
    }
    private func calcFuel()->Float{
        if var fuelF = Float(fuelVal){
            if(fuelUnit == fuelUnits.dollars){
                fuelF = fuelF/4.02
            }
            return fuelF*22.61*12
        }
        return 0.0
    }
    private func calcPropane()->Float{
        if var propanF = Float(propaneVal){
            if(propaneUnit == propaneUnits.dollars){
                propanF = propanF/2.47
            }
            return propanF*12.43*12
        }
        return 0.0
    }
    
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
