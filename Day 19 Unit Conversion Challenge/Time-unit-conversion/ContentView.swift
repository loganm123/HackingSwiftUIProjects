//
//  ContentView.swift
//  Time-unit-conversion
//
//  Created by Logan Marek on 3/16/21.
//

import SwiftUI

struct ContentView: View {
    @State var units: Int = 0
    @State var userEntered: String = ""
    @State var result: String = ""
    let timeUnits = ["Seconds","Minutes","Hours","Days"]
    @State var convertUnit: Int = 0

    var userUnitConvert: Double {
        let userTimeUnit = timeUnits[units]
        guard var userEnteredValueDub = Double(userEntered) else {return 0}
        switch userTimeUnit {
        case timeUnits[0]:
            userEnteredValueDub *= 1
        case timeUnits[1]:
            userEnteredValueDub *= 60
        case timeUnits[2]:
            userEnteredValueDub *= 360
        case timeUnits[3]:
            userEnteredValueDub *= 2160
        default:
            userEnteredValueDub *= 0
        }
        
        var total = userEnteredValueDub
        let convertUnitString: String = timeUnits[convertUnit]
        switch convertUnitString{
        case timeUnits[0]:
            total /= 1
        case timeUnits[1]:
            total /= 60
        case timeUnits[2]:
            total /= 360
        case timeUnits[3]:
            total /= 2160
        default:
            total *= 0
        }
        return total
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Enter conversion value")){
                    TextField("Time Units", text: $userEntered)
                        .keyboardType(.decimalPad)
                    Picker("Units", selection: $units){
                        ForEach(0..<timeUnits.count){
                            Text(("\(self.timeUnits[$0])"))
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                
                Section(header: Text("Unit to convert to")){
                    Picker("Units", selection:$convertUnit){
                        ForEach(0..<timeUnits.count){
                            Text(("\(self.timeUnits[$0])"))
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                
                Section(header: Text ("Your result")){
                    Text("\(userUnitConvert, specifier: "%.2f") \(timeUnits[convertUnit])")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
