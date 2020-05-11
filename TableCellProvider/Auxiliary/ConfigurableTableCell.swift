//
//  ConfigurableTableCell.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

protocol ConfigurableTableCell: ReusableView {
    associatedtype DataSource
    associatedtype Delegate: AnyObject
    
    var dataSource: DataSource! { get set }
    var delegate: Delegate! { get set }
    
    func configureWith(dataSource: DataSource, delegate: Delegate)
}
