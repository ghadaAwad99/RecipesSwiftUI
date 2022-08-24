//
//  HealthLablesViews.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 25/01/1444 AH.
//

import SwiftUI

struct HealthLablesView : View{
    var color = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    var recipe: Recipe?
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 8) {
                ForEach(recipe!.healthLabels.indices, id: \.self){ i in
                  ChipCustomView(text: recipe!.healthLabels[i] ?? "", backgroundColor: color, strokeColor: color)
                }
            }
        }
           
    }
}



