//
//  ShoppingItem.swift
//  shopping
//
//  Created by Bennet Schubert on 25.06.24.
//

import Foundation
import SwiftData


@Model
class ShoppingListItem: Identifiable
{
    var id: String
    var icon: String
    var name: String
    var countOfUse = 0
    
    init(icon: String, name: String) {
        self.id = UUID().uuidString
        self.icon = icon
        self.name = name
    }
}
