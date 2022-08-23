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
  
        List(viewModel.recipes, id: \.id) { item in
            NavigationLink(destination: RecipeDetailsView(recipe: item.recipe)){
                RecipeRow(item: item)
            }
            
        }.navigationTitle("Recipes")
            .searchable(text: $searchQuery,
                        placement: .navigationBarDrawer(displayMode: .always),
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
            )
        
     
//            .onAppear(){
//                print("on appear")
//                saveSuggestion()
//
//            }
//            .onSubmit({
//                print("on submit")
//                dismissSearch()
//                suggestionsList.append(searchQuery)
//                saveSuggestion()
//                print(searchQuery)
//                self.viewModel.fetchRecipes(query: searchQuery, filter: "vegan")
//            })
        
            .onSubmit(of: .search){
                print("on submit of")
                self.viewModel.fetchRecipes(query: searchQuery, filter: "vegan")
                viewModel.addSuggestion(suggestion: searchQuery)
                dismissSearch()
                //suggestionsList.append(searchQuery)
                //UserDefaults.standard.set(suggestionsList, forKey: Constants.userDefaultsKey)
              
            }
          
    }
}
