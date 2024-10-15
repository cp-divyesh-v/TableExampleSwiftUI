//
//  TableExampleSwiftUIApp.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import SwiftUI

@main
struct TableExampleSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            HomeTabView(viewModel: HomeTabViewModel())
        }
    }
}
