//
//  SwiftUIView.swift
//  WorkOrders
//
//  Created by taco on 8/3/20.
//  Copyright © 2020 Wrecks. All rights reserved.
//

import SwiftUI

struct CheckboxField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int
    let callback: (String, Bool)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 10,
        color: Color = Color.black,
        textSize: Int = 14,
        callback: @escaping (String, Bool)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.callback = callback
    }
    
    @State var isMarked:Bool = false
    
    var body: some View {
        Button(action:{
            self.isMarked.toggle()
            self.callback(self.id, self.isMarked)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "checkmark.square" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: size))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
