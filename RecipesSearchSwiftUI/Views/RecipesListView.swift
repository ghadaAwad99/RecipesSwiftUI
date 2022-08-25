//
//  RecipesListView.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct RecipesListView: View {
    @ObservedObject var viewModel = RecipesViewModel()
    @State var searchQuery = ""

    var body: some View {
        NavigationView{
            VStack {
               
                Text("Search input is not valid")
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .opacity(viewModel.isInputValid ? 0 : 1)
               
                RecipesList(viewModel: viewModel, searchQuery: $searchQuery)
            }
        }.onAppear{
            viewModel.fetchRecipes(query: "", filter: Constants.all)
        }
    }
}

