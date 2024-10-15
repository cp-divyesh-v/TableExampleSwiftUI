//
//  StudentGradeHistoryView.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import SwiftUI

struct StudentGradeHistoryView: View {

    @State var viewModel: StudentGradeHistoryViewModel
    @State private var sortOrder = [KeyPathComparator(\Student.name)]

    var body: some View {
        NavigationStack {
            Table(
                viewModel.students,
                selection: $viewModel.selectedStudents,
                sortOrder: $sortOrder,
                columns: {
                TableColumn("Index") { student in
                    let index = (viewModel.students.firstIndex(
                        where: { $0.id == student
                            .id }) ?? 0)
                    Text("No. \(index + 1)")
                }

                TableColumn("Id", value: \.id)

                TableColumn("Name", value: \.name)
                    .width(min: 150)

                TableColumn("Math") { student in
                    Text("\(student.gradeHistory.subjects.math)")
                        .foregroundStyle(
                            gradeColor(for: student.gradeHistory.subjects.math)
                        )
                }
                TableColumn("Science") { student in
                    Text("\(student.gradeHistory.subjects.science)")
                        .foregroundStyle(gradeColor(for: student.gradeHistory.subjects.science))
                }
                TableColumn("English") { student in
                    Text("\(student.gradeHistory.subjects.english)")
                        .foregroundStyle(gradeColor(for: student.gradeHistory.subjects.english))
                }
                TableColumn("Physics") { student in
                    Text("\(student.gradeHistory.subjects.physics)")
                        .foregroundStyle(gradeColor(for: student.gradeHistory.subjects.physics))
                }
                TableColumn("Computer") { student in
                    Text("\(student.gradeHistory.subjects.computer)")
                        .foregroundStyle(gradeColor(for: student.gradeHistory.subjects.computer))
                }
                TableColumn("Social Science") { student in
                    Text("\(student.gradeHistory.subjects.socialScience)")
                        .foregroundStyle(gradeColor(for: student.gradeHistory.subjects.socialScience))
                }
                })
            .tint(Color.purple.opacity(0.7))
            .onChange(of: sortOrder) {
                viewModel.students.sort(using: sortOrder)
            }
            .navigationTitle("Class 10th Grade")
            .toolbar(content: {
                EditButton()
            })
            .task {
                await viewModel.fetchStudents()
            }
        }
    }
    
    // Helper function to set color based on grade
    private func gradeColor(for grade: Int) -> Color {
        switch grade {
            case 90...100:
                return .green
            case 75..<90:
                return .yellow
            default:
                return .red
        }
    }
}

