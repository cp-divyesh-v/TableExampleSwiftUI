//
//  ContextManuTableViewModel.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 16/10/24.
//

import SwiftUI

@Observable
class ContextManuTableViewModel {
    var students: [Student] = []

    var alertPrompt: AlertPrompt?

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

    func onDelete(_ student: Student) {
        alertPrompt = .init(
            title: "Are you sure?",
            message: "Are you sure you want to delete the selected students? because this action cannot be undone",
            positiveBtnTitle: "Delete",
            positiveBtnAction: { [weak self] in
                guard let self else { return }
                self.alertPrompt = nil
                self._students.removeAll(where: {$0.id == student.id })
            },
            negativeBtnTitle: "Cancel",
            negativeBtnAction: { [weak self] in
                self?.alertPrompt = nil
            }
        )
    }

    func showNavigationDetailScreen(_ student: Student) {
        showDetailScreen = true
        destinationStudent = student
    }
}

