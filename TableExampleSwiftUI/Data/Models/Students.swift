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
    var students: [Student] = []

    enum CodingKeys: String, CodingKey {
        case id, name
        case gradeHistory = "grade_history"
        case students
    }
}

// MARK: - GradeHistory Model
struct GradeHistory: Codable, Identifiable{
    let id: String?
    let semester: String
    let subjects: Subjects

    init(
        id: String? = UUID().uuidString,
        semester: String,
        subjects: Subjects
    ) {
        self.id = id ?? UUID().uuidString
        self.semester = semester
        self.subjects = subjects
    }
}

// MARK: - Subjects Model
struct Subjects: Codable, Identifiable {
    let id: String?
    let math: Int
    let science: Int
    let english: Int
    let physics: Int
    let computer: Int
    let socialScience: Int

    init(
        id: String? = nil,
        math: Int,
        science: Int,
        english: Int,
        physics: Int,
        computer: Int,
        socialScience: Int
    ) {
        self.id = id ?? UUID().uuidString
        self.math = math
        self.science = science
        self.english = english
        self.physics = physics
        self.computer = computer
        self.socialScience = socialScience
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case math = "Math"
        case science = "Science"
        case english = "English"
        case physics = "Physics"
        case computer = "Computer"
        case socialScience = "Social Science"
    }
}
