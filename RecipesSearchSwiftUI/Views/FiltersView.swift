//
//  FiltersView.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct FiltersViews : View {
    @ObservedObject var viewModel: RecipesViewModel
    var body: some View{
        HStack {
            Button("ALL"){
                viewModel.fetchRecipes(query: "", filter: Constants.all)
            }.buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
            Button("Vegan"){
                viewModel.fetchRecipes(query: "", filter: Constants.vegan)
            }.buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
            Button("Keto"){
                viewModel.fetchRecipes(query: "", filter: Constants.keto)
            }.buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
            Button("Low Sugar"){
                viewModel.fetchRecipes(query: "", filter: Constants.lowSugar)
            }.buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
        }
    }
}
