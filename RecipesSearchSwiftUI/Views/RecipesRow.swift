//
//  RecipesRow.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI


struct RecipeRow: View {
    var item: Hit
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: item.recipe.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.purple.opacity(0.1)
                }
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                VStack{
                    Text("\(item.recipe.label)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(item.recipe.source)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HealthLablesView(recipe: item.recipe)
                }
                
            }.padding()
        }
    }
}
