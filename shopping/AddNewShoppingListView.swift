//
//  AddNewShoppingListView.swift
//  shopping
//
//  Created by Bennet Schubert on 25.06.24.
//

import SwiftUI
import SwiftData
struct AddNewShoppingListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var shoppingLists: [ShoppingList]
    
    @State var isDisabled = true
    @Binding var show: Bool
    @State var name = ""
    
    enum FocusField {
        case field
      }
    
    @FocusState private var focusedField: FocusField?

    func getTitle() -> String {
        if name.isEmpty || name == " " {
            isDisabled = true
            return "Add Shopping List"
        }

        
        return "Add " + name
    }
    func onSubmit() {
        if isDisabled {
            return
        }
        let shoppingList = ShoppingList(displayName: name, color: "", inBasket: [], notInBasket: [])
        modelContext.insert(shoppingList)
        show = false
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name...", text: $name, onCommit: onSubmit)
                    .focused($focusedField, equals: .field)
                    .onChange(of:name) {
                        let res = shoppingLists.first(where: {
                            $0.displayName == name
                        })
                        if (res == nil) {
                            print("asdasd")
                            isDisabled = false
                        } else {
                            isDisabled = true
                        }
                    }
                Button(getTitle()) {
                    onSubmit()
                }.disabled(isDisabled)
            }
            .defaultFocus($focusedField, .field)
            .navigationTitle(getTitle())
           
        }
        .presentationDetents([.medium])
        .onChange(of: show) {
            if show {
                name = ""
            }
        }
    }
}

#Preview {
    AddNewShoppingListView(show: .constant(true))
}
