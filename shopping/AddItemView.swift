//
//  AddItemView.swift
//  shopping
//
//  Created by Bennet Schubert on 24.06.24.
//

import SwiftUI
import SwiftData

struct AddItemView: View {
    @Environment(\.modelContext) private var modelContext
    @State var searchText = ""
    @Query var shoppingItems: [ShoppingListItem]
    @Query var shoppingLists: []
    
    @State var showSheet = false
    
    func addItemToShoppingList(x: ShoppingListItem) {
        
    }

    var body: some View {
        
            Button("Plus", systemImage: "plus") {
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet) {
                NavigationView() {
                    ScrollView {
                        LazyVStack {
                            let f = shoppingItems.firstIndex {
                                $0.name == searchText
                            }
                            if (f == nil && searchText != "") {
                                Button() {
                                    
                                } label: {
                                    BasketItemView(title: "Add " + searchText)
                                        .onTapGesture {
                                            showSheet.toggle()
                                            let si = ShoppingListItem(icon: "star", name: searchText)
                                            modelContext.insert(si)
                                        }
                                }
                            }
                            ListItemsView(searchText: searchText, callback: addItemToShoppingList)
                            
                        }
                        
                        .toolbar() {
                            
                            ToolbarItem {
                                Button() {
                                    showSheet.toggle()
                                } label: {
                                    RoundedImageView(icon: "xmark")
                                }
                            }
                        }
                        .navigationBarTitle("Add new Item", displayMode: .inline)
                        
                    }
                    .searchable(text: $searchText)

                    
                }
            }

    }
    init(showSheet: Bool = true) {
        
        self.showSheet = showSheet
        
        
    }
    
    
}

#Preview {

    AddItemView(showSheet: true)
}
