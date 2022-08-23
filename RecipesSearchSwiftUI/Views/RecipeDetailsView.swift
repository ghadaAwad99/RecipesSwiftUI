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
            shareButton(url: self.recipe.url)
        }){
            Image(systemName:"square.and.arrow.up" ).imageScale(.large)
        })
      
    }
    func shareButton(url: String) {
            let url = URL(string: url)
            let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

struct DetailsView : View {
    var body: some View{
        NavigationView{
            VStack {
                AsyncImage(url: URL(string: "https://blckbirds.com/wp-content/uploads/2021/10/pexels-kammeran-gonzalezkeola-6128227-2.jpg")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.purple.opacity(0.1)
                }
                .frame(width: .infinity, height: 200)
                Spacer()
             
            }
       
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
