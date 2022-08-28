//
//  SearchBar.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 30/01/1444 AH.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    @ObservedObject var viewModel: RecipesViewModel
    
    var body: some View {
        
        HStack {
            VStack{
                TextField("Search ..", text: $searchText){ startedEditing in
                    if startedEditing {
                        withAnimation {
                            isSearching = true
                        }
                    }
                }.padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if isSearching {
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                                
                            }
                            
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isSearching = true
                    }
                
                    .onSubmit {
                        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            viewModel.isInputValid = false
                        }
                        print(searchText)
                        if viewModel.isInputValid {
                            self.viewModel.addSuggestion(suggestion: searchText)
                            isSearching = false
                            self.viewModel.fetchRecipes(query: searchText)
                        }
                        
                    }
                
                
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
            if isSearching {
                Button(action: {
                    self.isSearching = false
                    self.searchText = ""
                    
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                
            }
        }
        
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
        }.overlay{
            if isSearching{
                List(viewModel.suggestionsList.reversed(), id: \.self){ suggestion in
                    Text(suggestion)
                        .onTapGesture {
                            searchText = suggestion
                        }
                }.listStyle(.insetGrouped)
            }
            
        }
        
    }
    
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar()
//    }
//}
