//
//  RecipesListView.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct RecipesListView: View {
    @ObservedObject var viewModel = RecipesViewModel()
    var body: some View {
        NavigationView{
            List(viewModel.recipes) { item in
                NavigationLink(destination: RecipeDetailsView(recipe: item.recipe)){
                        VStack {
                                    HStack {
                                        AsyncImage(url: URL(string: item.recipe.image)) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                        } placeholder: {
                                            Color.purple.opacity(0.1)
                                        }
                                        .frame(width: 100, height: 80)
                                        .cornerRadius(20)
                                        VStack{
                                            Text("\(item.recipe.label)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            Text("\(item.recipe.source)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                             Text("\(item.recipe.healthLabels[0])")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                      
                                    }.padding()
                                }
                }
            
            }
        }
        .onAppear {
            self.viewModel.fetchRecipes(query: "chicken")
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}
