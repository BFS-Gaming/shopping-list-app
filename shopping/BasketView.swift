//
//  Shop.swift
//  shop
//
//  Created by Bennet Schubert on 24.06.24.
//

import SwiftUI
import SwiftData

struct BasketView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var shoppingLists: [ShoppingList]
    
    @State var name = ""
    
    @State var showAddItemSheet = false
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())

    ]
    func getList() -> ShoppingList {
        let f = shoppingLists.first {
            $0.selected == true
        }
        if (f == nil) {
            let shoppingList = ShoppingList(displayName: "My List", color: "", inBasket: [], notInBasket: [], selected: true)
            modelContext.insert(shoppingList)
            return shoppingList
        }
        return f!
    }

    var body: some View {
        
        NavigationView {
            ScrollView {
                let f = shoppingLists.first {
                    $0.selected == true
                }
                let list = getList()
                Group {
                    LazyVGrid(columns: columns) {
                        ForEach(list.notInBasket) { x in
                            BasketItemView()
                        }
                        BasketItemView()
                        BasketItemView()
                    }
                    Divider()
                        
                    Text("Already in Basket")
                    LazyVGrid(columns: columns) {
                        BasketItemView(inBasket: true)
                        BasketItemView(inBasket: true)
                        BasketItemView(inBasket: true)
                    }
                }.padding()
                    
            }
            .navigationTitle("Current Basket")
            .toolbar {
                ToolbarItem {
                    SelectShoppingListView()
                    
                }
                ToolbarItem {
                    AddItemView()
                    
                }
            }
            
            
        }
    }
    init()
    {
        
    }

}

#Preview {
    BasketView()
}
