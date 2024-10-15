//
//  StudentGradeHistoryViewModel.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import Foundation

@Observable
class StudentGradeHistoryViewModel {
    var students: [Student] = []

    var selectedStudents: Set<Student.ID> = []

    private let studentRepository: StudentRepository

    init() {
        studentRepository = StudentRepository()
    }

    func fetchStudents() async {

        let result = await studentRepository.getStudents()
        switch result {
            case .success(let students):
                self.students = students.students
            case .failure(let error):
                print("Error: \(error)")
        }
    }
}
