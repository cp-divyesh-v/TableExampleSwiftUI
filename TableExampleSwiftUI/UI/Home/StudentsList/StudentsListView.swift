//
//  StudentsListView.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import SwiftUI

struct StudentsListView: View {

    @State var viewModel: StudentsListViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.students, id: \.id) { student in
                NavigationLink(
                    destination: StudentDetailView(viewModel: StudentDetailViewModel(student: student))
                ) {
                    VStack(alignment: .leading) {
                        Text(student.name)
                            .font(.headline)
                        Text("ID: \(student.id)")
                            .font(.subheadline)
                    }
                }
            }
//            .listStyle(.plain)
//            .navigationTitle("Students")
            .task {
                await viewModel.fetchStudents()
            }
        }
        .alertPrompt(item: $viewModel.alertPrompt)
    }
}
