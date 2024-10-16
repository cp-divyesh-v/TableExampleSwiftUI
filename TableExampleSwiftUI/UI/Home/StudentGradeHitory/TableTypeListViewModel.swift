//
//  TableTypeListViewModel.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import Foundation

@Observable
class TableTypeListViewModel {
    var _students: [Student] = []
    var students: [Student] {
        var data: [Student] = _students
        if !searchText.isEmpty {

            data = _students.filter { student in
                student.name.lowercased().contains(searchText.lowercased()) ||
                student.id.lowercased().contains(searchText.lowercased()) ||
                "\(student.gradeHistory.subjects.math)".contains(searchText) ||
                "\(student.gradeHistory.subjects.science)".contains(searchText) ||
                "\(student.gradeHistory.subjects.english)".contains(searchText) ||
                "\(student.gradeHistory.subjects.physics)".contains(searchText) ||
                "\(student.gradeHistory.subjects.computer)".contains(searchText) ||
                "\(student.gradeHistory.subjects.socialScience)".contains(searchText)
            }
        }

        return data
    }

    var alertPrompt: AlertPrompt?

    var selectedStudents: Set<Student.ID> = []
    var searchText: String = ""

    //Navigation variables
    var showDetailScreen: Bool = false
    var destinationStudent: Student?
    
    private let studentRepository: StudentRepository

    init() {
        studentRepository = StudentRepository()
    }

    func onViewAppear() {
        showDetailScreen = false
        destinationStudent = nil
        selectedStudents.removeAll()
    }

    func fetchStudents() async {

        let result = await studentRepository.getStudents()
        switch result {
            case .success(let students):
                self._students = students.students
            case .failure(let error):
                print("Error: \(error)")
        }
    }

    func onDelete(_ student: Student) {
        alertPrompt = .init(
            title: "Are you sure?",
            message: "Are you sure you want to delete the selected students? because this action cannot be undone",
            positiveBtnTitle: "Delete",
            positiveBtnAction: { [weak self] in
                self?.alertPrompt = nil
            },
            negativeBtnTitle: "Cancel",
            negativeBtnAction: { [weak self] in
                guard let self else { return }
                self.alertPrompt = nil
                self._students.removeAll(where: {$0.id == student.id })
            }
        )
    }

    func showNavigationDetailScreen(_ student: Student) {
        showDetailScreen = true
        destinationStudent = student
    }
}
