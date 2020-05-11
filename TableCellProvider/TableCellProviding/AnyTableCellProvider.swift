//
//  AnyTableCellProvider.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

class AnyTableCellProvider {
    
    // MARK: Private properties
    
    private let _getDataSource: () -> Any
    private let _setDataSource: (Any) -> Void
    private let _cellForRowAt: (IndexPath) -> UITableViewCell
    private let _didSelectRow: () -> Void

    // MARK: Initialization
    
    init<TCP: TableCellProviding>(_ tcp: TCP) {
        _getDataSource = tcp.getDataSource
        _setDataSource = { tcp.set(dataSource: $0 as! TCP.DataSource) }
        _cellForRowAt = tcp.cellForRow(at:)
        _didSelectRow = tcp.didSelectRow
    }

}

// MARK: - Public API

extension AnyTableCellProvider {

    func getDataSource<DS>() -> DS? { _getDataSource() as? DS }
    func set<DS>(dataSource: DS) { _setDataSource(dataSource) }
    func cellForRow(at indexPath: IndexPath) -> UITableViewCell { _cellForRowAt(indexPath) }
    func didSelectRow() { _didSelectRow() }

}
