//
//  ResponseModel.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//





import Foundation
struct ResponseModel: Codable {
    let from, to, count: Int
    let links: Links?
    let hits: [Hit]
    enum CodingKeys: String, CodingKey {
           case from, to, count
           case links = "_links"
           case hits
       }

}

// MARK: - Hit
struct Hit: Codable, Identifiable {
    let id = UUID()
    let recipe: Recipe
    let links: Links?

       enum CodingKeys: String, CodingKey {
           case recipe
           case links = "_links"
       }


}

// MARK: - Links
struct Links: Codable {
    let linksSelf, next: Next?
    enum CodingKeys: String, CodingKey {
            case linksSelf = "self"
            case next
        }
}

// MARK: - Next
struct Next: Codable {
    let href, title: String
}

// MARK: - Recipe
struct Recipe: Codable {
    let uri, label, image: String

    let source, url, shareAs: String
    let yield: Int
    let  healthLabels, ingredientLines: [String]
 
 



}



//
//// MARK: - ResponseModel
//struct ResponseModel: Codable {
//    let q: String
//    let from, to: Int
//    let more: Bool
//    let count: Int
//    let hits: [Hit]
//}
//
//// MARK: - Hit
//struct Hit: Codable, Identifiable {
//    let id = UUID()
//    let recipe: Recipe
//
//}
//// MARK: - Recipe
//
//
//// MARK: - Recipe
//struct Recipe: Codable {
//    let uri: String
//    let label: String
//    let image: String
//    let source: String
//    let url: String
//    let shareAs: String
//    let healthLabels, ingredientLines: [String?]
//}
//
//
//// MARK: - Ingredient
//struct Ingredient: Codable {
//    let text: String
//    let quantity: Double
//    let measure: String?
//    let food: String
//    let weight: Double
//    let foodCategory, foodID: String
//    let image: String?
//
//}
//
//enum MealType: String, Codable {
//    case lunchDinner = "lunch/dinner"
//    case snack = "snack"
//}
//
//enum HealthLables: String, Codable {
//    case keto = "keto-friendly"
//    case lowSugar = "low-sugar"
//    case vegan = "vegan"
//    case all = "health=keto-friendly&health=low-sugar&health=vegan"
//    case noLable = ""
//}
