//
//  Array+Extensions.swift
//  TMROPickerView
//
//  Created by Benji Dodgson on 11/7/19.
//  Copyright © 2019 Tomorrow Ideas. All rights reserved.
//

import Foundation

internal extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
