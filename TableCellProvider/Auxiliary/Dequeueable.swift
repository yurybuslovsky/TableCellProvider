//
//  Dequeueable.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Dequeueable

typealias Dequeueable = ReusableView & NIBLoadableView

// MARK: - Reusable View

protocol ReusableView: class {}

extension ReusableView where Self: UIResponder {
    static var reuseID: String { .init(describing: self) }
}

// MARK: - NIB Loadable View

protocol NIBLoadableView: class {}

extension NIBLoadableView where Self: UIResponder, Self: ReusableView {
    static var nib: UINib { .init(nibName: reuseID, bundle: nil) }
}
