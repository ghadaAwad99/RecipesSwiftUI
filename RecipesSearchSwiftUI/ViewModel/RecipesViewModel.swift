//
//  RecipesViewModel.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import Foundation
import Alamofire

class RecipesViewModel: ObservableObject {
    var searchRegex = ".*[^A-Za-z ].*"
    
    @Published  var recipes: [Hit] = []
    @Published var response : ResponseModel!
    @Published var suggestionsList  = UserDefaults.standard.object(forKey: Constants.userDefaultsKey) as? [String] ?? []
    @Published var isInputValid = true
    @Published var isSearchEmpty = true
    @Published var isListEmpty = false
    
    
  
    func fetchRecipes( query: String) {
        AF.request("\(Constants.baseUrl)q=\(query)&app_id=\(Constants.appId)&app_key=\(Constants.appKey)" , method: .get)
              .validate()
              .responseDecodable(of: ResponseModel.self){ (response) in
                  guard let recipesResponse = response.value else {
                       return
                   }
                   self.response = recipesResponse
                   self.recipes = recipesResponse.hits
                   self.checkForEmptyList()
           }
    }
    
    func addSuggestion(suggestion: String){
        if suggestionsList.count == 10 {
            suggestionsList.removeFirst()
        }
        if !suggestionsList.contains(suggestion){
            suggestionsList.append(suggestion)
            print("suggestion list \(suggestion)")
        }
        UserDefaults.standard.set(suggestionsList, forKey: Constants.userDefaultsKey)
    }
    
    func validateInput(input: String) {
        if input.range(of: searchRegex, options: .regularExpression) != nil {
            isInputValid = false
        }else {
            isInputValid = true
        }
    }
    
    func checkForEmptyList(){
        if recipes.isEmpty{
            isListEmpty = true
        }else{
            isListEmpty = false
        }
    }
    
    func loadMoreRecipes(nextPageURL: String){
        AF.request(nextPageURL , method: .get)
               .validate()
               .responseDecodable(of: ResponseModel.self){ (response) in
                   guard let recipesResponse = response.value else {
                       return
                   }
                   self.response = recipesResponse
                   self.recipes.append(contentsOf: recipesResponse.hits)
                   self.checkForEmptyList()
           }
    }
}
