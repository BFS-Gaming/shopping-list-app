//
//  ShopItemView.swift
//  shopping
//
//  Created by Bennet Schubert on 24.06.24.
//

import SwiftUI

struct BasketItemView: View {
    var title = "Placeholder"
    var inBasket = false
    var body: some View {
        VStack {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .scaledToFit()
                .foregroundColor(inBasket ? .black : .white)
                
            Text(title)
                .font(.system(size: 20))
                .foregroundStyle(inBasket ? .black : .white)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(inBasket ? Color.alreadyInBasket : Color.notBought)
                
        )
        
    }
}

#Preview {
    BasketItemView()
}
