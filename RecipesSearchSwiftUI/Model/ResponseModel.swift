//
//  ResponseModel.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//


import Foundation

// MARK: - ResponseModel
struct ResponseModel: Codable {
    let q: String
    let from, to: Int
    let more: Bool
    let count: Int
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable, Identifiable {
    let id = UUID()
    let recipe: Recipe
  
}

// MARK: - Recipe
struct Recipe: Codable {
    let uri: String
    let label: String
    let image: String
    let source: String
    let url: String
    let shareAs: String
    let healthLabels, ingredientLines: [String?]
}


// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    let quantity: Double
    let measure: String?
    let food: String
    let weight: Double
    let foodCategory, foodID: String
    let image: String?

}

enum MealType: String, Codable {
    case lunchDinner = "lunch/dinner"
    case snack = "snack"
}

enum HealthLables: String, Codable {
    case keto = "keto-friendly"
    case lowSugar = "low-sugar"
    case vegan = "vegan"
    case all = "health=keto-friendly&health=low-sugar&health=vegan"
    case noLable = ""
}
