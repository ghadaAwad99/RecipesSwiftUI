//
//  ChipCustomView.swift
//  RecipesSearchSwiftUI
//
//  Created by Hala Mustafa on 26/01/1444 AH.
//

import SwiftUI

struct ChipCustomView : View {
    var text: String
    var backgroundColor : UIColor
    var strokeColor : UIColor
    var body: some View{
        Text(text)
            .padding()
            .frame( height: 32)
            .fixedSize()
            .background(Capsule(style: .continuous).strokeBorder(Color(strokeColor)).background(Color(backgroundColor)))
            .clipShape(Capsule())
            .foregroundColor(.blue)
            .font(.footnote)
    }
}

struct ChipCustomView_Previews: PreviewProvider {
    
    static var previews: some View {
        let color = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        ChipCustomView(text: "chip title", backgroundColor: color, strokeColor: color)
    }
}
