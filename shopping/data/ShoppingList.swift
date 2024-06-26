//
//  ShoppingList.swift
//  shopping
//
//  Created by Bennet Schubert on 25.06.24.
//

import Foundation
import SwiftData

@Model
class ShoppingList: Identifiable {
    var id: String
    var displayName: String
    var color: String
    
    var inBasket: [ShoppingListItem]
    var notInBasket: [ShoppingListItem]
    
    var selected = false
    
    init(displayName: String, color: String, inBasket: [ShoppingListItem], notInBasket: [ShoppingListItem], selected: Bool = false) {
        self.id = UUID().uuidString
        self.displayName = displayName
        self.color = color
        self.inBasket = inBasket
        self.notInBasket = notInBasket
        self.selected = selected
    }
}
