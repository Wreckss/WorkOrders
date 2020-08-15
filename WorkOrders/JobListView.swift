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
                    ForEach(jobItems.jobsArray) { job in
                        Text(job.jobNumber)
                    }
                    .onDelete(perform: removeJob)
                }
                Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarItems(leading: Button(action: {
                let newJob = JobItem(jobNumber: "Job #\(jobItems.jobsArray.count+1)")
                self.jobItems.jobsArray.append(newJob)
            })
            {
                Image(systemName: "plus")
            }
            , trailing: EditButton())
        }
    }
    
    func removeJob(at offsets: IndexSet) {
        jobItems.jobsArray.remove(atOffsets: offsets)
    }

}
