//
//  RecipesList.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct RecipesList: View {
 
    @Environment(\.dismissSearch) private var dismissSearch
    @ObservedObject var viewModel: RecipesViewModel
    @State var searchQuery : String
  
    
    var body: some View {
        VStack{
            EmptyListViewBuilder(objects: viewModel.recipes)
        
        List(viewModel.recipes, id: \.id) { item in
            NavigationLink(destination: RecipeDetailsView(recipe: item.recipe)){
                RecipeRow(item: item)
            }
            
        }
            
        .navigationTitle("Recipes")
            .searchable(text: $searchQuery,
                        
                        prompt: "Search for a recipe",
                        suggestions: {
                
                ForEach(
                    viewModel.suggestionsList,
                    id: \.self
                ) { suggestion in
                    Button(suggestion) {
                      print("suggestion \(suggestion)")
                        searchQuery = suggestion
                    }
                }
                
                
            }
            ).keyboardType(.asciiCapable)
            .onSubmit(of: .search){
                viewModel.validateInput(input: searchQuery)
                if viewModel.isInputValid {
                    viewModel.fetchRecipes(query: searchQuery, filter: "vegan")
                    viewModel.addSuggestion(suggestion: searchQuery)
                }
                dismissSearch()
            }
          
        }
    }
  

}

