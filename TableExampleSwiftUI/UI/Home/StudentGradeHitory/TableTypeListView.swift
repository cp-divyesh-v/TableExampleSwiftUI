//
//  TableTypeListView.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import SwiftUI

struct TableTypeListView: View {

    @State var viewModel: TableTypeListViewModel

    @State private var navigationPath = [TableTypes]()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                ForEach(TableTypes.allCases, id: \.key) { type in
                    Button(action: {
                        navigationPath.append(type)
                    }) {
                        Text(type.key)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .contentShape(Rectangle())
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(
                    .init(top: 2.5, leading: 5, bottom: 2.5, trailing: 5)
                )
            }
            .navigationDestination(for: TableTypes.self) { screen in                                getScreenFromType(screen)
            }
            .navigationTitle("Table Options")
        }
    }

    @ViewBuilder
    func getScreenFromType(_ type: TableTypes) -> some View {
        switch type {
            case .plainTable:
                PlainTableView(viewModel: .init())
            case .singleSelectionTable:
                SingleSelectionTableView(viewModel: .init())
            case .multipleSelectionTable:
                MultipleSelectionTableView(viewModel: .init())
            case .sortableTable:
                SortableTableView(viewModel: .init())
            case .searchableTable:
                SearchableTableView(viewModel: .init())
            case .expandableTable:
                ExpandableTableView(viewModel: .init())
            case .contextMenuTable:
                ContextManuTableView(viewModel: ContextManuTableViewModel())
            case .everythingInOneTable:
                EverythingInOneTableView(viewModel: .init())
        }
    }
}


enum TableTypes: String, Equatable, CaseIterable {
    case plainTable
    case singleSelectionTable
    case multipleSelectionTable
    case sortableTable
    case searchableTable
    case expandableTable
    case contextMenuTable
    case everythingInOneTable

    var key: String {
        switch self {
            case .plainTable:
                return "PlainTable"
            case .singleSelectionTable:
                return "SingleSelectionTable"
            case .multipleSelectionTable:
                return "MultipleSelectionTable"
            case .sortableTable:
                return "SortableTable"
            case .searchableTable:
                return "SearchableTable"
            case .expandableTable:
                return "ExpandableTable"
            case .contextMenuTable:
                return "ContextMenuTable"
            case .everythingInOneTable:
                return "EverythingInOneTable"
        }
    }
}
