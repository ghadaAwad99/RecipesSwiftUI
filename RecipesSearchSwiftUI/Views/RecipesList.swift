//
//  RecipesList.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI





struct RecipesList: View {
    @ObservedObject var viewModel: RecipesViewModel
    @Binding var searchQuery : String
    @State var isSearching = false
  
    
    var body: some View {
        VStack{
            viewModel.isSearchEmpty ? Text("Searchh for a Recipe...") : Text("")
            
            viewModel.isListEmpty ? Text("We couldn't find: \(searchQuery)") : Text("")
        
            SearchBar(searchText: $searchQuery, isSearching: $isSearching, viewModel: viewModel)
         
            
        .navigationTitle("Recipes")
            .keyboardType(.asciiCapable)
            .onChange(of: searchQuery){ newQuery in
                    viewModel.validateInput(input: newQuery)
                    if newQuery.isEmpty{
                        viewModel.isSearchEmpty = true
                        viewModel.isListEmpty = false
                    }
                    else{
                        viewModel.isSearchEmpty = false
                    }
                }
        }
    }
}

