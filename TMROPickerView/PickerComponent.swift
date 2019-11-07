//
//  PickerComponent.swift
//  TMROPickerView
//
//  Created by Benji Dodgson on 11/7/19.
//  Copyright © 2019 Tomorrow Ideas. All rights reserved.
//

import Foundation

public struct PickerComponent<Item: CustomStringConvertible> {
    var componentIndex: Int
    var items: [Item]
}
