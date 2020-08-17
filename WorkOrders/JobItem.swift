//
//  JobItem.swift
//  WorkOrders
//
//  Created by taco on 8/14/20.
//  Copyright © 2020 Wrecks. All rights reserved.
//

import Foundation

//by making this struct conform to Identifiable, we no longer need to refer to id in ForEach
struct JobItem: Identifiable, Codable {
    let jobID: Int
    let jobNumber: String
    var id = UUID()
}


class JobItems: ObservableObject, Identifiable {
    @Published var jobsArray = [JobItem]() {
        //explained at https://www.hackingwithswift.com/books/ios-swiftui/making-changes-permanent-with-userdefaults
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try?
                encoder.encode(jobsArray) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try?
                decoder.decode([JobItem].self, from: items) {
                self.jobsArray = decoded
                return
            }
        }
        self.jobsArray = []
    }
    
}
