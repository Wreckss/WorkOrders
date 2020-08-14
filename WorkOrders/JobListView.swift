//
//  JobListView.swift
//  WorkOrders
//
//  Created by taco on 8/13/20.
//  Copyright © 2020 Wrecks. All rights reserved.
//

import SwiftUI

struct JobListView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var jobNumbers = [String](arrayLiteral: "Job #1", "Job #2")
    var userName: String
    
    var body: some View {
        NavigationView {
            VStack {
                    List {
                        ForEach(jobNumbers, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    Button("Dismiss") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                    .navigationBarItems(trailing: EditButton())
            }
        }
    
}
