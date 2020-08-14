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
    
    var body: some View {
        
        VStack {
            ZStack {
                Text("Company Name")
            }
            .background(backgroundBlue)
            .clipShape(Rectangle())
            .cornerRadius(CGFloat(cornerRadius))
            .font(.largeTitle)
            
            VStack {
                TextField("Username", text: $userName)
                TextField("Password", text: $userPassword)
                
                HStack {
                    CheckboxField(id: "username", label: "Remember Username", callback: checkboxSelected)
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            
            
            ZStack {
                Button("Log in") {
                   // setUserName(userName: userName)
                    self.showingJobList.toggle()
                }
                .sheet(isPresented: $showingJobList) {
                    JobListView(userName: "pickleRick")
                }
            }
            .background(Color.gray)
            .clipShape(Rectangle())
            .cornerRadius(CGFloat(cornerRadius))
        }
    }
    

    
    func checkboxSelected(id: String, isMarked: Bool) {
        print("\(id) is marked: \(isMarked)")
    }
    
//    func setUserName(userName: String) {
//        user.userName = userName
//    }
    
//    func setRememberUserName() {
//        let encoder = JSONEncoder()
//
//        if let data = try? encoder.encode(self.user) {
//            UserDefaults.standard.set(data, forKey: "SavedUserName")
//        }
//    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
