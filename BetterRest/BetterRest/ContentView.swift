//
//  ContentView.swift
//  BetterRest
//
//  Created by Ramon Felix on 03/07/22.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Cuando deseas despertar?")
                    .font(.headline)
                DatePicker("Seleccione una hora", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("Cuanto desea dormir?").font(.headline)
                    
                Stepper("\(sleepAmount.formatted()) hours",value: $sleepAmount, in:4...12, step: 0.25)
                
                Text("Tazas de cafe al dia").font(.headline)
                Stepper(coffeAmount == 1 ? "1 taza":"\(coffeAmount) tazas", value: $coffeAmount, in: 1...20)
            }
            .padding()
            .navigationTitle("Descansa Mejor")
            .toolbar {
                Button("Calcular",action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK"){}
            } message: {
                Text(alertMessage)
            }
        }
    }
    func calculateBedtime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let component = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (component.hour ?? 0) * 60 * 60
            let minute = (component.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Tu tiempo ideal es"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        }
        catch{
            alertTitle = "Error"
            alertMessage = "Hubo un problema calculando tu tiempo"
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
