//
//  SearchableTableViewModel.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import Foundation

@Observable
class SearchableTableViewModel {
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


    var searchText: String = ""

    private let studentRepository: StudentRepository

    init() {
        studentRepository = StudentRepository()
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
}
