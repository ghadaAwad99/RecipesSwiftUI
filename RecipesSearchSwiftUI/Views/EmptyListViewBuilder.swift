//
//  EmptyListViewBuilder.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 26/01/1444 AH.
//

import SwiftUI

struct EmptyListViewBuilder: View {
    var objects: [Hit]

    var body: some View {
        listView
    }

    @ViewBuilder
    var listView: some View {
        if objects.isEmpty{
            emptyListView
        }
    }

    var emptyListView: some View {
        Text("Oops, loos like there's no data...\n Search for a recipe")
    }
}
