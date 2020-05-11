//
//  BaseTableCellProvider.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

class BaseTableCellProvider<DataSource, Delegate, Cell: UITableViewCell>
    where
    DataSource == Cell.DataSource,
    Delegate == Cell.Delegate,
    Cell: ConfigurableTableCell
{

    // MARK: Public properties

    final var dataSource: DataSource
    final unowned var delegate: Delegate
    final unowned var tableView: UITableView
    final var indexPath: IndexPath!

    // MARK: Initialization

    required init(dataSource: DataSource, delegate: Delegate, tableView: UITableView) {
        self.dataSource = dataSource
        self.delegate = delegate
        self.tableView = tableView
        tableView.register(Cell.self)
    }

    // MARK: May-be-overridden API

    func didSelectRow() {}

}

// MARK: - Table Cell Providing

extension BaseTableCellProvider: TableCellProviding {

    func getDataSource() -> DataSource { dataSource }
    func set(dataSource: DataSource) { self.dataSource = dataSource }

    func cellForRow(at indexPath: IndexPath) -> Cell {
        self.indexPath = indexPath
        let cell = tableView.dequeueReusableCell(for: indexPath) as Cell
        cell.configureWith(dataSource: dataSource, delegate: delegate)
        return cell
    }

}
