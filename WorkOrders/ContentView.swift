//
//  ContentView.swift
//  WorkOrders
//
//  Created by taco on 8/2/20.
//  Copyright © 2020 Wrecks. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingJobList = false
    @State private var userName = ""
    @State private var userPassword = ""
    private var cornerRadius = 12
    private var backgroundBlue = Color.blue
    @State var activeJobView = ActiveJobView()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Username", text: $userName)
                    TextField("Password", text: $userPassword)
                    HStack {
                        CheckboxField(id: "username", label: "Remember Username", callback: checkboxSelected)
                    }
                }
                .navigationBarTitle("Company Name")
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                NavigationLink(destination: activeJobView) {
                    Text("Log in")
                }
            }
        }
    }
    
    func checkboxSelected(id: String, isMarked: Bool) {
        print("\(id) is marked: \(isMarked)")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
