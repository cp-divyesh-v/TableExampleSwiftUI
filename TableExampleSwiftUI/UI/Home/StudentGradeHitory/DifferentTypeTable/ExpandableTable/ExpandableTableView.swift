//
//  ExpandableTableView.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 16/10/24.
//

import SwiftUI

struct ExpandableTableView: View {
    
    @State var viewModel: ExpandableTableViewModel
    
    var body: some View {
        Group {
            Table(
                of: Student.self,
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
                            .foregroundStyle(gradeColor(for: student.gradeHistory.subjects.math))
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
                }, rows: {
                    ForEach(viewModel.students) { student in
                        if student.students.isEmpty {
                            TableRow(student)
                        } else {
                            DisclosureTableRow(student) {
                                ForEach(student.students)
                            }
                        }
                    }
                })
            .tint(Color.purple.opacity(0.7))
            .navigationTitle("Expandable Table")
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

