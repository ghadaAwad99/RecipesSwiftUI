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
