//
//  ContentView.swift
//  unitconvert
//
//  Created by Ramon Felix on 22/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var quantity=0
    @State private var unitFrom="Meters"
    @State private var unitTo="Kilometers"
    
    var result:Double{
        var retValue:Double = 0
        if (quantity != 0){
            let idxFrom = units.firstIndex(of: unitFrom) ?? 0
            let idxTo = units.firstIndex(of: unitTo) ?? 0
            
            let valueFrom = Double(unitsMeters[idxFrom] * quantity)
            let valueTo = Double(unitsMeters[idxTo])
            retValue = valueFrom / valueTo
        }
        return retValue
    }
    
    let units = ["Meters","Kilometers","Feets","Yards","Miles"]
    let unitsMeters = [1000,1000000,304,914,1609344]
    @FocusState private var qtyIsFocused:Bool
    
    var body: some View {
        NavigationView{
            Form{
                //unit from
                Section{
                    Picker("Unit1",selection: $unitFrom){
                        ForEach(units,id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }header: {
                    Text("Select the original unit:")
                }
                //user quantity
                Section{
                    TextField("Quantity",value: $quantity,format: .number)
                        .keyboardType(.decimalPad)
                        .focused($qtyIsFocused)
                }header: {
                    Text("Enter the Quantity")
                }
                //unit to
                Section{
                    Picker("Unit1",selection: $unitTo){
                        ForEach(units,id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }header: {
                    Text("Select the resulting unit:")
                }
                //result
                Section{
                    Text(result,format: .number)
                }
            }
            .navigationTitle("Unit Conversion")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        qtyIsFocused=false
                    }
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
