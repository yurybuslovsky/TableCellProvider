//
//  TableCellProviding.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

protocol TableCellProviding: class {
    associatedtype DataSource
    associatedtype Delegate: AnyObject
    associatedtype Cell: UITableViewCell
    
    var delegate: Delegate { get set }
    var dataSource: DataSource { get set }
    var tableView: UITableView { get set }
    var indexPath: IndexPath! { get set }
    
    init(dataSource: DataSource, delegate: Delegate, tableView: UITableView)
    
    func getDataSource() -> DataSource
    func set(dataSource: DataSource)
    func cellForRow(at indexPath: IndexPath) -> Cell
    func didSelectRow()
}

