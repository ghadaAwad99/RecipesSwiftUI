//
//  RecipeDetailsView.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipe: Recipe
    var body: some View{
     
        
            ScrollView(.vertical) {
            VStack {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.purple.opacity(0.1)
                }
                .scaledToFill()
                .frame(width: .infinity, height: UIScreen.main.bounds.height / 3)
                .clipped()
                Text(recipe.label)
                    .multilineTextAlignment(.leading)
                    .font(.title)
                    .padding()
                Divider()
                    .frame(width: UIScreen.main.bounds.width - 50)
                Text("ingredients:")
                    .padding()
                    .font(.subheadline)
                ForEach(recipe.ingredientLines.indices, id: \.self){ item in
                    Text(recipe.ingredientLines[item] ?? "")
                }
                Button("Try It Now!"){
                    print(recipe.url)
                }.buttonStyle(.borderedProminent)
             
            }
            }
       
        .navigationTitle("title")
            .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
            print("button pressed")
            //shareButton(url: self.recipe.url)
        }){
            Image(systemName:"square.and.arrow.up" ).imageScale(.large)
    })
        
        
  
}
       
      
    }
    func shareButton(url: String) {
            let url = URL(string: url)
            let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }


//struct RecipeDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
