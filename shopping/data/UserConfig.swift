//
//  UserConfig.swift
//  shopping
//
//  Created by Bennet Schubert on 25.06.24.
//

import Foundation
import SwiftData
@Model
class UserConfig: Identifiable {
    var id: String
    var currentShoppingList: ShoppingList?
    init(currentShoppingList: ShoppingList? = nil) {
        self.id = UUID().uuidString
        self.currentShoppingList = currentShoppingList
    }
}
