//
//  RecipesList.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI





struct RecipesList: View {
 
    @Environment(\.dismissSearch) private var dismissSearch
    @Environment(\.isSearching) var isSearching
    @ObservedObject var viewModel: RecipesViewModel
    @Binding var searchQuery : String
  
    
    var body: some View {
        VStack{
            viewModel.isSearchEmpty ? Text("Searchh for a Recipe...") : Text("")
            
            viewModel.isListEmpty ? Text("We couldn't find: \(searchQuery)") : Text("")
        
            SearchableView(viewModel: viewModel)
                .padding(.vertical)
            
        .navigationTitle("Recipes")
            .searchable(text: $searchQuery,
                        
                        prompt: "Search for a recipe",
                        suggestions: {
                
                ForEach(
                    viewModel.suggestionsList.reversed(),
                    id: \.self
                ) { suggestion in
                    Button(suggestion) {
                        searchQuery = suggestion
                    }
                }   
            })
            .keyboardType(.asciiCapable)
            .onChange(of: searchQuery){ newQuery in
                    viewModel.validateInput(input: newQuery)
                    if newQuery.isEmpty{
                        viewModel.isSearchEmpty = true
                    }
                    else{
                        viewModel.isSearchEmpty = false
                    }
                }
            .onSubmit(of: .search){
                if searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    viewModel.isInputValid = false
                }
                // only call API and add to suggestion list when the input is valid
                if viewModel.isInputValid {
                    viewModel.fetchRecipes(query: searchQuery, filter: Constants.keto)
                    viewModel.addSuggestion(suggestion: searchQuery)
                }
                dismissSearch()
            }
        }
    }
}

