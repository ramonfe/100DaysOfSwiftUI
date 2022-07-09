//
//  MainUIView.swift
//  iExpense
//
//  Created by Ramon Felix on 08/07/22.
//

import SwiftUI

struct ExpenseItem: Identifiable, Encodable, Decodable{
    var id = UUID()
    let name:String
    let type:String
    let amount:Double
}

class Expenses:ObservableObject{
    @Published var items = [ExpenseItem](){
        didSet{
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try?  JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items=[]
    }
}

struct MainView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpsense = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items){item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name).font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .toolbar {
                Button{
                    showingAddExpsense = true  
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpsense){
                AddView(expenses: expenses)
            }
            .navigationTitle("iExpense")
        }
    }
    func removeItems(at offsets:IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
