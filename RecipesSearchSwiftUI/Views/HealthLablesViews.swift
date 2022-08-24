//
//  HealthLablesViews.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct HealthLablesView : View{
    var recipe: Recipe?
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 8) {
                ForEach(recipe!.healthLabels.indices, id: \.self){ i in
                    ChipCustomView(text: recipe?.healthLabels[i] ?? "" , backgroundColor: Constants.grayColor, strokeColor: Constants.grayColor)
                }
            }
        }
           
    }
}



