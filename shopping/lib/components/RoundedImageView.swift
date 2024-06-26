//
//  RoundedImageView.swift
//  shopping
//
//  Created by Bennet Schubert on 24.06.24.
//

import SwiftUI

struct RoundedImageView: View {
    var icon = "xmark"
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.all, 5)
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
                    .accessibility(label:Text("Close"))
                    .accessibility(hint:Text("Tap to close the screen"))
                    .accessibility(addTraits: .isButton)
                    .accessibility(removeTraits: .isImage)
    }
}

#Preview {
    RoundedImageView()
}
