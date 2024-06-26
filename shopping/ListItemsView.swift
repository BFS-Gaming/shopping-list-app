//
//  ListItemsView.swift
//  shopping
//
//  Created by Bennet Schubert on 25.06.24.
//

import SwiftUI
import SwiftData
struct ListItemsView: View {
    @Query var shoppingItems: [ShoppingListItem]
    var callback: (ShoppingListItem) -> Void
    var body: some View {
        ForEach(shoppingItems, content: {
            i in
            BasketItemView(title: i.name)
        })
    }
    init(searchText: String, callback: @escaping (ShoppingListItem) -> Void) {
        self.callback = callback
        _shoppingItems = Query(
            filter: #Predicate{
                if searchText.isEmpty {
                    return true
                } else {
                    return $0.name.localizedStandardContains(searchText)
                }
            },
            sort: [SortDescriptor(\ShoppingListItem.countOfUse)]
        )
    }
}
func forPreview(x: ShoppingListItem) {
    return
}
#Preview {
  
    ListItemsView(searchText: "", callback: forPreview)
}
