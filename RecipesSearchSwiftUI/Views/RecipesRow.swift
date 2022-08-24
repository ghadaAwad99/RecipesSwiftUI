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
        VStack(alignment: .leading){
            
            HStack(alignment: .top, spacing: 16) {
                AsyncImage(url: URL(string: item.recipe.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color(Constants.primaryColor).opacity(0.1)
                }
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
                
                VStack(spacing: 8){
                    Text("\(item.recipe.label)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                    
                    Text("\(item.recipe.source)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            
            HealthLablesView(recipe: item.recipe)
        }.padding(6)
    }
}
