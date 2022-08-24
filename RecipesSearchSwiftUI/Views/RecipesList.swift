//
//  RecipesList.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct SearchableView: View {
  @Environment(\.isSearching) var isSearching
    @ObservedObject var viewModel: RecipesViewModel
    @Environment(\.dismissSearch) private var dismissSearch


    
  var body: some View {
      if !isSearching {
          FiltersViews(viewModel: viewModel)
      }
      
      List(viewModel.recipes, id: \.id) { item in
          NavigationLink(destination: RecipeDetailsView(recipe: item.recipe)){
              RecipeRow(item: item)
          }
          
          
      }
      .onChange(of: isSearching){ newValue in
          if !newValue {
              print("not searching")
              viewModel.isInputValid = true
              viewModel.isListEmpty = false
          }
      }
     
  }
}

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
            
        .navigationTitle("Recipes")
            .searchable(text: $searchQuery,
                        
                        prompt: "Search for a recipe",
                        suggestions: {
                
                ForEach(
                    viewModel.suggestionsList.reversed(),
                    id: \.self
                ) { suggestion in
                    Button(suggestion) {
                      print("suggestion \(suggestion)")
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
                print("onSubmit")
                if searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    viewModel.isInputValid = false
                }
                // only call API and add to suggestion list when the input is valid
                if viewModel.isInputValid {
                    viewModel.fetchRecipes(query: searchQuery, filter: "vegan")
                    viewModel.addSuggestion(suggestion: searchQuery)
                }
                //viewModel.checkForEmptyList()
                dismissSearch()
            }
        }
    }
}

