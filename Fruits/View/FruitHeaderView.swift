//
//  FruitHeaderView.swift
//  Fruits
//
//  Created by Ekaterina Galkina on 24/05/2023.
//

import SwiftUI

struct FruitHeaderView: View {
    var fruit: Fruit
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimating ? 1.0 : 0.8)
        }
        .frame(height: 440)
        .onAppear() {
            withAnimation(.easeOut(duration: 1)) {
                isAnimating = true
            }
        }
    }
}

struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData[1])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
