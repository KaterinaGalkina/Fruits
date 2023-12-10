//
//  FruitRowView.swift
//  Fruits
//
//  Created by Ekaterina Galkina on 24/05/2023.
//

import SwiftUI

struct FruitRowView: View {
    var fruit: Fruit
    func removeLines(text: String) -> String {
        let list: Array = Array(text)
        let limNumber: Int = 65
        
        var i: Int = 0
        var word: String = ""
        var sentence: Array = [""]
        while i < min(list.count, limNumber) {
            if String(list[i]) != " " {
                word += String(list[i])
            } else {
                sentence.append(word)
                word = ""
            }
            i += 1
        }
        if word != "" && i < limNumber {
            sentence.append(word)
        } else {
            sentence.append("...")
        }
        sentence.remove(at: 0)
        return sentence.joined(separator:" ")
    }
    
    var body: some View {
        HStack {
            Image(fruit.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(radius: 3)
                .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(removeLines(text: fruit.headline))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(4)
            //Text("\(fruit.description)")
        }
        .background {
            Rectangle()
                .foregroundColor(.white.opacity(0.0))
                .cornerRadius(15)
        }
    }
}

struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        FruitRowView(fruit: fruitsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
