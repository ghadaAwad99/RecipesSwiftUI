//
//  RecipesViewModel.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import Foundation
import Alamofire

class RecipesViewModel: ObservableObject {
   @Published  var recipes: [Hit] = []
   
   func fetchRecipes( query: String) {
           let type = "public"
           let appId = "d22c1dbf"
           let appKey = "87181e89d80e667c503c6a20ac642d4a"
           let baseUrl = "https://api.edamam.com/api/recipes/v2?"
           let param : Parameters = [
               "type" : type,
               "q":query,
               "app_id" : appId,
               "app_key" : appKey
           ]

           AF.request(baseUrl , method: .get, parameters: param)

               .validate()

               .responseDecodable(of: ResponseModel.self){ (response) in

                   guard let recipesResponse = response.value else {

                       print("else")

                       return

                   }

                   print("recipes response")
                   self.recipes = recipesResponse.hits
                   print(recipesResponse.hits[0].recipe.label)
           }
   }
}