//
//  Student.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import Foundation

// MARK: - Student Model
struct Student: Codable, Identifiable {
    let id: String
    let name: String
    let gradeHistory: GradeHistory

    enum CodingKeys: String, CodingKey {
        case id, name
        case gradeHistory = "grade_history"
    }
}

// MARK: - GradeHistory Model
struct GradeHistory: Codable, Identifiable{
    var id: String? = UUID().uuidString
    let semester: String
    let subjects: Subjects

    init(semester: String, subjects: Subjects) {
        self.semester = semester
        self.subjects = subjects
    }
}

// MARK: - Subjects Model
struct Subjects: Codable {
    let math: Int
    let science: Int
    let english: Int
    let physics: Int
    let computer: Int
    let socialScience: Int

    enum CodingKeys: String, CodingKey {
        case math = "Math"
        case science = "Science"
        case english = "English"
        case physics = "Physics"
        case computer = "Computer"
        case socialScience = "Social Science"
    }
}
