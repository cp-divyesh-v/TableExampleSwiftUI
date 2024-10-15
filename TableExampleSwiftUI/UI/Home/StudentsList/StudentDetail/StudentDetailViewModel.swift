//
//  StudentDetailViewModel.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import Foundation

@Observable
class StudentDetailViewModel {
    var student: Student

    init(student: Student) {
        self.student = student
    }
}
