//
//  EmptyListViewBuilder.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 26/01/1444 AH.
//

import SwiftUI

struct EmptyListViewBuilder: View {
    var message: String
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
        Text(message)
    }
}
