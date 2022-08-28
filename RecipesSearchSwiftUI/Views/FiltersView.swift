//
//  FiltersView.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct FiltersViews : View {
    @ObservedObject var viewModel: RecipesViewModel
    @State var isAllSelected = false
    @State var isVeganSelected = false
    @State var isKetoSelected = false
    @State var isLowSugarSelected = false
    
    var body: some View{
        HStack {
            Button("ALL"){
                isAllSelected = true
                if isAllSelected {
                    isVeganSelected = false
                    isKetoSelected = false
                    isLowSugarSelected = false
                    viewModel.recipes =  viewModel.recipes.filter{
                        $0.recipe.healthLabels.contains("Vegan") ||   $0.recipe.healthLabels.contains("Keto-Friendly") || $0.recipe.healthLabels.contains("Low Sugar")
                    }
                }
            }.buttonStyle(.bordered)
                .background(isAllSelected ? Color(Constants.primaryColor) : Color(Constants.grayColor))
                .foregroundColor(Color.black)
                .clipShape(Capsule())
                .buttonBorderShape(.capsule)
            
            Button("Vegan"){
                isVeganSelected = true
                if isVeganSelected {
                    isAllSelected = false
                    isKetoSelected = false
                    isLowSugarSelected = false
                    viewModel.recipes =  viewModel.recipes.filter{
                        $0.recipe.healthLabels.contains("Vegan")
                    }
                }
                
            }.buttonStyle(.bordered)
                .background(isVeganSelected ? Color(Constants.primaryColor) : Color(Constants.grayColor))
                .foregroundColor(Color.black)
                .clipShape(Capsule())
                .buttonBorderShape(.capsule)
            
            Button("Keto"){
                isKetoSelected = true
                if isKetoSelected {
                    isAllSelected = false
                    isVeganSelected = false
                    isLowSugarSelected = false
                    viewModel.recipes =  viewModel.recipes.filter{
                        $0.recipe.healthLabels.contains("Keto-Friendly")
                    }
                }
            }.buttonStyle(.bordered)
                .background(isKetoSelected ? Color(Constants.primaryColor) : Color(Constants.grayColor))
                .foregroundColor(Color.black)
                .clipShape(Capsule())
                .buttonBorderShape(.capsule)
            
            Button("Low Sugar"){
                isLowSugarSelected = true
                if isLowSugarSelected{
                    isAllSelected = false
                    isVeganSelected = false
                    isKetoSelected = false
                    viewModel.recipes =  viewModel.recipes.filter{
                        $0.recipe.healthLabels.contains("Low Sugar")
                    }
                }
            }.buttonStyle(.bordered)
                .background(isLowSugarSelected ? Color(Constants.primaryColor) : Color(Constants.grayColor))
                .foregroundColor(Color.black)
                .clipShape(Capsule())
                .buttonBorderShape(.capsule)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersViews(viewModel: RecipesViewModel())
    }
}

