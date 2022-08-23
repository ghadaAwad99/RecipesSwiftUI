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
    @State var isSearchEmpty = false
    var body: some View {
        NavigationView{
            VStack {
                Filters(viewModel: viewModel)
                Text("Search can not be empty")
                    .opacity(isSearchEmpty ? 1 : 0)
                RecipesList(viewModel: viewModel, suggestionsList: suggestionsList, searchQuery: searchQuery)
                    /*.overlay{
                        if self.viewModel.recipes.isEmpty{
                            EmptyResultsView(query: $searchQuery)
                        }
                      
                    }*/
                  
            }
            
        }
        .onAppear {
            self.viewModel.fetchRecipes(query: "chicken", filter: "vegan")
        }
      
    }
}

struct HealthLablesView : View{
    var recipe: Recipe
    var body: some View{
        ForEach(0...5, id: \.self){ i in
            HStack {
                Button(recipe.healthLabels[i] ?? "") {
                }.buttonStyle(.bordered)
                    .foregroundColor(.blue)
                    .font(.caption)
                    .disabled(true)
            }
        }
    }
}

struct Filters : View {
    @ObservedObject var viewModel: RecipesViewModel
    var body: some View{
        HStack {
            Button("ALL"){
                viewModel.fetchRecipes(query: "", filter: "keto-friendly&health=low-sugar&health=vegan")
            }.buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
            Button("Vegan"){
                viewModel.fetchRecipes(query: "", filter: "vegan")
            }.buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
            Button("Keto"){
                viewModel.fetchRecipes(query: "", filter: "keto-friendly")
            }.buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
            Button("Low Sugar"){
                viewModel.fetchRecipes(query: "", filter: "low-sugar")
            }.buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}

struct RecipeRow: View {
    var item: Hit
    var body: some View {
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
                    HealthLablesView(recipe: item.recipe)
                }
                
            }.padding()
        }
    }
}

struct RecipesList: View {
    @ObservedObject var viewModel: RecipesViewModel
    var suggestionsList : [String]
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
                self.viewModel.fetchRecipes(query: searchQuery, filter: "vegan")
            }
    }
}
