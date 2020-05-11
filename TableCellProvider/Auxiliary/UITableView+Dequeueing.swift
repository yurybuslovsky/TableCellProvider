//
//  UITableView+Dequeueing.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

extension UITableView {

    final func register<Cell: UITableViewCell>(_ cell: Cell.Type) where Cell: Dequeueable {
        register(Cell.nib, forCellReuseIdentifier: Cell.reuseID)
    }
    
    final func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell where Cell: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell with ID: \(Cell.reuseID)")
        }
        
        return cell
    }

}
