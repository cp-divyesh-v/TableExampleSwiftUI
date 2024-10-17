//
//  EverythingInOneTableView.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 16/10/24.
//

import SwiftUI

struct EverythingInOneTableView: View {
    
    @State var viewModel: EverythingInOneTableViewModel

    var body: some View {
        Group {
            Table(
                of: Student.self,
                selection: $viewModel.selectedStudents,
                sortOrder: $viewModel.sortOrder,
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
                    
                    TableColumn("Math", value:\.gradeHistory.subjects.math) {
                        Text("\($0.gradeHistory.subjects.math)")
                            .foregroundStyle(gradeColor(for: $0.gradeHistory.subjects.math))
                    }
                    TableColumn("Science", value: \.gradeHistory.subjects.science) {
                        Text("\($0.gradeHistory.subjects.science)")
                            .foregroundStyle(gradeColor(for: $0.gradeHistory.subjects.science))
                    }
                    TableColumn("English", value: \.gradeHistory.subjects.english) {
                        Text("\($0.gradeHistory.subjects.english)")
                            .foregroundStyle(gradeColor(for: $0.gradeHistory.subjects.english))
                    }
                    TableColumn("Physics", value: \.gradeHistory.subjects.physics) {
                        Text("\($0.gradeHistory.subjects.physics)")
                            .foregroundStyle(gradeColor(for: $0.gradeHistory.subjects.physics))
                    }
                    TableColumn("Computer", value: \.gradeHistory.subjects.computer) {
                        Text("\($0.gradeHistory.subjects.computer)")
                            .foregroundStyle(gradeColor(for: $0.gradeHistory.subjects.computer))
                    }
                    TableColumn("Social Science", value: \.gradeHistory.subjects.socialScience) {
                        Text("\($0.gradeHistory.subjects.socialScience)")
                            .foregroundStyle(gradeColor(for: $0.gradeHistory.subjects.socialScience))
                    }
                }, rows: {
                    ForEach(viewModel.students) { student in
                        if student.students.isEmpty {
                            TableRow(student)
                                .contextMenu {
                                    Button("Edit") {
                                        // TODO open editor in inspector
                                    }
                                    
                                    Button("See Details") {
                                        viewModel
                                            .showNavigationDetailScreen(student)
                                    }
                                    
                                    Divider()
                                    
                                    Button("Delete", role: .destructive) {
                                        viewModel.onDelete(student)
                                    }
                                }
                        } else {
                            DisclosureTableRow(student) {
                                ForEach(student.students)
                            }
                        }
                    }
                })
            .searchable(text: $viewModel.searchText, prompt: "Search by Name id & grades")
            .tint(Color.purple.opacity(0.7))
            .onChange(of: viewModel.sortOrder) {
                viewModel._students.sort(using: viewModel.sortOrder)
            }
            .navigationDestination(isPresented: $viewModel.showDetailScreen, destination: {
                if let student = viewModel.destinationStudent {
                    StudentDetailView(viewModel: StudentDetailViewModel(student: student))
                }
            })
            .navigationTitle("Final Table")
#if os(iOS)
            .toolbar(content: {
                EditButton()
            })
#endif
            .alertPrompt(item: $viewModel.alertPrompt)
            .task {
                await viewModel.fetchStudents()
            }
            .onAppear {
                viewModel.onViewAppear()
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

