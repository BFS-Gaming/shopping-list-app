//
//  ContentView.swift
//  shopping
//
//  Created by Bennet Schubert on 24.06.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    @State var selection = Tab.baskets
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                Text("Stats")
                    .badge(0)
                    .tag(Tab.stats)
                    .tabItem { Label("Stats", systemImage: "figure.stair.stepper") }
                BasketView()
                    .badge(100)
                    .tag(Tab.baskets)
                    .tabItem { Label("Basket", systemImage: "basket") }
                Text("Settings")
                    .tag(Tab.settings)
                    .tabItem { Label("Settings", systemImage: "gear") }
                
            }
        }
    }

}
enum Tab: Int {
    case stats = 0
    case baskets = 1
    case settings = 2
    var title: String {
            switch self {
                case .stats:
                return "Stats"
                case .baskets:
                return "Personal Basket"
                case .settings:
                return "Settings"
            }
        }
}
#Preview {
    ContentView()
        .modelContainer(for: [ShoppingList.self, ShoppingListItem.self, UserConfig.self], inMemory: true)
}
