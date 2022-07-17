//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ramon Felix on 12/07/22.
//

import SwiftUI

struct CupcakeOrder: Codable{
    static let types = ["Vanilla", "Strawberry","Chocolate"]
    
    var type = 0
    var quantity = 3
    var specialRequestEnabled = false{
        didSet{
            if specialRequestEnabled == false{
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress=""
    var city=""
    var zip=""
    var hasValidAddress: Bool{
        if name.trimmingCharacters(in: .whitespaces).isEmpty ||
            streetAddress.trimmingCharacters(in: .whitespaces).isEmpty ||
            city.trimmingCharacters(in: .whitespaces).isEmpty ||
            zip.trimmingCharacters(in: .whitespaces).isEmpty
        {
            return false
        }
        
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty{
            return false
        }
        
        return true
    }
    
    var cost: Double{
        //2 per cake
        var cost = Double(quantity) * 2
        //complicated cakes cost more
        cost += (Double(type)/2)
        //1 for xtra frosting
        if (extraFrosting){
            cost += Double(quantity)
        }
        //.5 for sprinkles
        if addSprinkles{
            cost += Double(quantity)/2
        }
        return cost
    }
}

class Order: ObservableObject{
    @Published var item = CupcakeOrder()
    
    //    static let types = ["Vanilla", "Strawberry","Chocolate"]
    //
    //    @Published var type = 0
    //    @Published var quantity = 3
    //    @Published var specialRequestEnabled = false{
    //        didSet{
    //            if specialRequestEnabled == false{
    //                extraFrosting = false
    //                addSprinkles = false
    //            }
    //        }
    //    }
    //    @Published var extraFrosting = false
    //    @Published var addSprinkles = false
    //
    //    @Published var name = ""
    //    @Published var streetAddress=""
    //    @Published var city=""
    //    @Published var zip=""
    //    var hasValidAddress: Bool{
    //        if name.trimmingCharacters(in: .whitespaces).isEmpty ||
    //            streetAddress.trimmingCharacters(in: .whitespaces).isEmpty ||
    //            city.trimmingCharacters(in: .whitespaces).isEmpty ||
    //            zip.trimmingCharacters(in: .whitespaces).isEmpty
    //        {
    //            return false
    //        }
    //
    //        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty{
    //            return false
    //        }
    //
    //        return true
    //    }
    //
    //    var cost: Double{
    //        //2 per cake
    //        var cost = Double(quantity) * 2
    //        //complicated cakes cost more
    //        cost += (Double(type)/2)
    //        //1 for xtra frosting
    //        if (extraFrosting){
    //            cost += Double(quantity)
    //        }
    //        //.5 for sprinkles
    //        if addSprinkles{
    //            cost += Double(quantity)/2
    //        }
    //        return cost
    //    }
//    enum CodingKeys: CodingKey {
//        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
//    }
//    init() {}
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        type = try container.decode(Int.self, forKey: .type)
//        quantity = try container.decode(Int.self, forKey: .quantity)
//
//        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//
//        name = try container.decode(String.self, forKey: .name)
//        streetAddress = try container.decode(String.self, forKey: .streetAddress)
//        city = try container.decode(String.self, forKey: .city)
//        zip = try container.decode(String.self, forKey: .zip)
//    }
//    func encode(to encoder: Encoder) throws{
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(type, forKey: .type)
//        try container.encode(quantity, forKey: .quantity)
//
//        try container.encode(extraFrosting, forKey: .extraFrosting)
//        try container.encode(addSprinkles, forKey: .addSprinkles)
//
//        try container.encode(name, forKey: .name)
//        try container.encode(streetAddress, forKey: .streetAddress)
//        try container.encode(city, forKey: .city)
//        try container.encode(zip, forKey: .zip)
//    }
}

struct ContentView: View {
    @StateObject var order = Order()
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    //a picker don´t work without a navigationview
                    Picker("Select you cake type",selection: $order.item.type){
                        ForEach(CupcakeOrder.types.indices){
                            Text(CupcakeOrder.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.item.quantity)",value: $order.item.quantity,in: 3...20)
                }
                Section{
                    Toggle("Any special request",isOn: $order.item.specialRequestEnabled.animation())
                    if order.item.specialRequestEnabled{
                        Toggle("Add extra frosting",isOn: $order.item.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.item.addSprinkles)
                    }
                }
                Section{
                    NavigationLink{
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
