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
        ScrollView(.horizontal){
            HStack(spacing: 8) {
                ForEach(0...5, id: \.self){ i in
                Button(recipe.healthLabels[i] ?? "") {
                }
                .fixedSize()
                .buttonStyle(.bordered)
                .foregroundColor(.blue)
                 .font(.footnote)
                .disabled(true)
                .buttonBorderShape(.capsule)
                    
            
            }
            }
        }
           
    }
}
