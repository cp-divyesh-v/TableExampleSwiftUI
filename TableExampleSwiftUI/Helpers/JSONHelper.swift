//
//  JSONHelper.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import Foundation

class JSONHelper {
    static let isTestMode: Bool = false
    static let templateName: String = "students_sample_data"

    public static func readJSONFromFile<T: Decodable>(fileName: String,
                                                      type: T.Type,
                                                      bundle: Bundle? = nil) async throws -> T {
        // Get the bundle URL for the file
        guard let url = (bundle ?? Bundle.main).url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: "JSONUtils", code: 404, userInfo: [NSLocalizedDescriptionKey: "File not found"])
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            throw NSError(domain: "JSONUtils", code: 500, userInfo: [NSLocalizedDescriptionKey: "Decoding error: \(error)"])
        }
    }
}


private class DemoBundleFakeClass {}

extension Bundle {
    static var demoBundle: Bundle {
        return Bundle(for: DemoBundleFakeClass.self)
    }
}


public class DeallocPrinter {
    private let className: String
    private let prefix: String
    
    public init(_ className: String, prefix: String = "XX") {
        self.className = className
        self.prefix = prefix
        print("\(prefix) - init \(className)")
    }
    
    deinit {
        print("\(prefix) - deinit \(className)")
    }
}



public extension Date {
    func getDateIn(format: String = "YYYY MM dd, hh:mm:ss:SSSSSS") -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

class Log {
    init(prefix: String = "==== [\(Date().getDateIn())] BL ", message: String) {
        LogI(prefix, message: message)
    }
}


func LogI(_ prefix: String = "==== [\(Date().getDateIn())] ", message: String) {
    print(prefix + message)
}
