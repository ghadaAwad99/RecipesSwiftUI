//
//  SearchableView.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 27/01/1444 AH.
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
                  .onAppear{
                      let thresholdIndex = viewModel.recipes.endIndex - 1
                      if thresholdIndex == viewModel.recipes.firstIndex(where: {$0.id == item.id}) ?? 0 {
                          viewModel.loadMoreRecipes(nextPageURL: viewModel.response.links?.next?.href ?? "")
                              }
                  }
          }
      }
      
      
      .onChange(of: isSearching){ newValue in
          if !newValue {
              viewModel.isInputValid = true
              viewModel.isListEmpty = false
          }else{
              viewModel.isSearchEmpty = false
          }
      }
     
  }
}
