//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ramon Felix on 15/07/22.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var alertTitle = ""
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3){image in
                    image
                        .resizable()
                        .scaledToFit()
                }placeholder: {
                    ProgressView()
                }
                .accessibilityHidden(true)
                .frame(height: 233)
                Text("Your total is \(order.item.cost, format: .currency(code: "USD"))")
                    .font(.title)
                Button("Place order",action: {
                    Task{
                        await placeOrder()
                    }
                })
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert(alertTitle, isPresented: $showingConfirmation) {
            Button("OK"){}
        }message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order.item) else{
            print("failed to encode")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do{
            let (data,_) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(CupcakeOrder.self, from: data)
            confirmationMessage = "You order for \(decodedOrder.quantity)x \(CupcakeOrder.types[decodedOrder.type].lowercased()) cupcakes is on the way"
            alertTitle = "Thank you"
            showingConfirmation =  true
        } catch{
            confirmationMessage = "Your Order Failed, please check your wifi and retry"
            alertTitle = "Error"
            showingConfirmation = true
        }
    }
}


struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
