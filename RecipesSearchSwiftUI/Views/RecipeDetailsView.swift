//
//  RecipeDetailsView.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipe: Recipe!
    var body: some View{
        NavigationView{
              Text("\(recipe.label)")
        }.navigationBarItems(trailing: Button(action: {
            print("button pressed")
            //shareButton(url: self.recipe.url)
        }){
            Image(systemName:"square.and.arrow.up" ).imageScale(.large)
        })
      
    }
}

struct DetailsView : View {
    var body: some View{
        NavigationView{
              Text("title")
        }.navigationBarItems(trailing: Button(action: {
            print("button pressed")
            //shareButton(url: self.recipe.url)
        }){
            Image(systemName:"square.and.arrow.up" ).imageScale(.large)
        })
      
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
