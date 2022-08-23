//
//  RecipesListView.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct RecipesListView: View {
    @ObservedObject var viewModel = RecipesViewModel()
    var suggestionsList = ["first","second"]
    @State var searchQuery = ""
    var body: some View {
        NavigationView{
            VStack {
                Text("filters goes here")
                List(viewModel.recipes, id: \.id) { item in
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
                                            .frame(width: 150, height: 150)
                                            .cornerRadius(20)
                                            VStack{
                                                Text("\(item.recipe.label)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                Text("\(item.recipe.source)")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                             
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                          
                                        }.padding()
                                    }
                    }
                
                }.navigationTitle("Recipes")
                    .searchable(text: $searchQuery,
                                placement: .navigationBarDrawer(displayMode: .always),
                                prompt: "Search for a recipe",
                                suggestions: {

                        ForEach(
                          suggestionsList,
                            id: \.self
                        ) { suggestion in
                            Button(suggestion) {
                              searchQuery = suggestion
                            }
                        }

                    })
                    .onSubmit(of: .search){
                        print(searchQuery)
                        self.viewModel.fetchRecipes(query: searchQuery)
                    }
                    /*.overlay{
                        if self.viewModel.recipes.isEmpty{
                            EmptyResultsView(query: $searchQuery)
                        }
                      
                    }*/
                  
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
