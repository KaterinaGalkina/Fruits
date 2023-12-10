//
//  OnboardingView.swift
//  Fruits
//
//  Created by Ekaterina Galkina on 23/05/2023.
//

import SwiftUI

struct OnboardingView: View {
    var fruits: [Fruit] = fruitsData
    var body: some View {
        TabView {
            ForEach(fruits[0..<fruits.count]) { item in
                FruitCardView(fruit: item)
                    .shadow(color: .black.opacity(0.5), radius: 10)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitsData)
    }
}
