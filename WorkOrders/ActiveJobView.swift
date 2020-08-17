//
//  JobListView.swift
//  WorkOrders
//
//  Created by taco on 8/13/20.
//  Copyright © 2020 Wrecks. All rights reserved.
//

import SwiftUI

struct ActiveJobView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var jobItems = JobItems()
    @State var jobCount = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(jobItems.jobsArray) { job in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(job.jobNumber)")
                                    .font(.headline)
                                Text("\(job.jobNumber)")
                            }
                        }
                    }
                    .onDelete(perform: removeJob)
                }
            }
        }
        .navigationBarTitle("Active Jobs")
        .navigationBarItems(leading: Button(action: {
            jobCount += 1
            let newJob = JobItem(jobNumber: "Job #\(jobCount)")
            self.jobItems.jobsArray.append(newJob)
        })
        {
            Image(systemName: "plus")
        }
        , trailing: EditButton())
    }
    
    func removeJob(at offsets: IndexSet) {
        jobItems.jobsArray.remove(atOffsets: offsets)
    }

}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
