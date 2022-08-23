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
    @Published var suggestionsList : [String] = UserDefaults.standard.object(forKey: Constants.userDefaultsKey) as? [String] ?? []
    var searchRegex = "[A-Za-z ]+"
    @Published var isInputValid = true
   
    func fetchRecipes( query: String, filter: String) {
      
       
        AF.request("\(Constants.baseUrl)q=\(query)&app_id=\(Constants.appId)&app_key=\(Constants.appKey)&health=\(filter)" , method: .get)

               .validate()

               .responseDecodable(of: ResponseModel.self){ (response) in

                   guard let recipesResponse = response.value else {

                       print("else")

                       return

                   }

                   print("recipes response")
                   self.recipes = recipesResponse.hits
                   print(recipesResponse.hits.count)
           }
   }
    
    func addSuggestion(suggestion: String){
        if !suggestionsList.contains(suggestion){
            suggestionsList.append(suggestion)
        }
        UserDefaults.standard.set(suggestionsList, forKey: Constants.userDefaultsKey)
    }
    
    func validateInput(input: String) {
        if input.range(of: searchRegex, options: .regularExpression) == nil
            || input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            print("not valid")
            isInputValid = false
        }else {
            print("valid")
            isInputValid = true
        }
    }
}
