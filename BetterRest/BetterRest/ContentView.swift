//
//  ContentView.swift
//  BetterRest
//
//  Created by Ramon Felix on 03/07/22.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date{
        var component = DateComponents()
        component.hour = 7
        component.minute = 0
        return Calendar.current.date(from: component) ?? Date.now
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section("Cuando deseas despertar?") {
                    DatePicker("Seleccione una hora", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
//                VStack(alignment: .leading, spacing: 0){
//                    Text("Cuando deseas despertar?")
//                        .font(.headline)
//                    DatePicker("Seleccione una hora", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                        .labelsHidden()
//                }
                Section("Cuanto deseas Dormir") {
                    Stepper("\(sleepAmount.formatted()) horas",value: $sleepAmount, in:4...12, step: 0.25)
                }
//                VStack(alignment: .leading, spacing: 0){
//                    Text("Cuanto desea dormir?").font(.headline)
//
//                    Stepper("\(sleepAmount.formatted()) horas",value: $sleepAmount, in:4...12, step: 0.25)
//                }
                Section("Tazas de cafe al día"){
                    Picker("Número de tazas", selection: $coffeAmount) {
                        ForEach(0..<21){
                            Text($0==1 ?"\($0) taza" : "\($0) tazas")
                        }
                    }
//                    Stepper(coffeAmount == 1 ? "1 taza":"\(coffeAmount) tazas", value: $coffeAmount, in: 1...20)
                }
//                VStack(alignment: .leading, spacing: 0){
//                    Text("Tazas de cafe al dia").font(.headline)
//                    Stepper(coffeAmount == 1 ? "1 taza":"\(coffeAmount) tazas", value: $coffeAmount, in: 0...20)
//                }
                Section("Tu hora de dormir es"){
                    Text(calculateBedtime).font(.largeTitle)
                }
            }
            .navigationTitle("Descansa Mejor")
//            .toolbar {
//                Button("Calcular",action: calculateBedtime)
//            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK"){}
            } message: {
                Text(alertMessage)
            }
        }
    }
    var calculateBedtime:String{
        var toReturn = ""
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let component = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (component.hour ?? 0) * 60 * 60
            let minute = (component.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            //alertTitle = "Tu tiempo ideal es"
            toReturn = sleepTime.formatted(date: .omitted, time: .shortened)
            
        }
        catch{
            //alertTitle = "Error"
            //alertMessage = "Hubo un problema calculando tu tiempo"
        }
        //showingAlert = true
        return toReturn
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
