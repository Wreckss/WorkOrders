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
    var userName: String
    
    @ObservedObject var jobItems = JobItems()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(jobItems.jobsArray, id: \.id) { job in
                        Text(job.jobNumber)
                    }
                }
                Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarItems(leading: Button(action: {
                //TODO: allow this button to add to jobsArray
                let job = JobItem(jobNumber: "Job #\(jobItems.jobsArray.count+1)")
                self.jobItems.jobsArray.append(job)
            })
            {
                Image(systemName: "plus")
            }
            , trailing: EditButton())
        }
    }
    

    
}
