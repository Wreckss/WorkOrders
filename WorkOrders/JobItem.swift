//
//  JobItem.swift
//  WorkOrders
//
//  Created by taco on 8/14/20.
//  Copyright © 2020 Wrecks. All rights reserved.
//

import Foundation

struct JobItem {
    let jobNumber: String
    let id = UUID()
}

class JobItems: ObservableObject {
    @Published var jobsArray = [JobItem](arrayLiteral: JobItem(jobNumber: "Job #1"))
}
