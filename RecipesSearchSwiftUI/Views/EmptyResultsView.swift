//
//  EmptyResultsView.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct EmptyResultsView: View {
    @Binding var query: String
    var body: some View {
        Text("We couldn't find: \(query)")
    }
}

struct EmptyResultsView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyResultsView(query: .constant("dfhsuddhos"))
    }
}
