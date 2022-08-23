//
//  HealthLablesViews.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct HealthLablesView : View{
    var recipe: Recipe
    var body: some View{
        ForEach(0...5, id: \.self){ i in
            HStack {
                Button(recipe.healthLabels[i] ?? "") {
                }.buttonStyle(.bordered)
                    .foregroundColor(.blue)
                    .font(.caption)
                    .disabled(true)
            }
        }
    }
}
