//
//  StudentRepository.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import Foundation

class StudentRepository {

    init() {
    }

    func getStudents() async -> Result<Students, Error> {
        var students: Students = Students(students: [])

        do {
            students = try await JSONHelper
                .readJSONFromFile(fileName: JSONHelper.templateName,
                                                                      type: Students.self)
            return Result.success(students)
        } catch {
            return Result.failure(error)
        }
    }
}
