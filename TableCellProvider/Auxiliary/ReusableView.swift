//
//  ReusableView.swift
//  TableCellProvider
//
//  Created by Yury Buslovsky on 10.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIResponder {
    static var reuseID: String { .init(describing: self) }
}
