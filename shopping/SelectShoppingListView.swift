//
//  SelectShoppingListView.swift
//  shopping
//
//  Created by Bennet Schubert on 25.06.24.
//

import SwiftUI
import SwiftData

struct SelectShoppingListView: View {
    @Query var shoppingLists: [ShoppingList]
    @State var a = false
    func add() {
        a.toggle()
    }
    var body: some View {
        Menu {
            ForEach(shoppingLists) {
                shoppingList in
                Button(shoppingList.displayName) {}
            }
            Button("Add new List" , systemImage: "plus", action: add)
        } label: {
            Image(systemName: "list.bullet")
        }.sheet(isPresented: $a) {
            AddNewShoppingListView(show: $a)
        }
    }
}

#Preview {
    SelectShoppingListView()
}
