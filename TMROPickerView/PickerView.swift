//
//  PickerView.swift
//  TMROPickerView
//
//  Created by Benji Dodgson on 11/7/19.
//  Copyright © 2019 Tomorrow Ideas. All rights reserved.
//

import Foundation
import UIKit

open class PickerView<Item: CustomStringConvertible>: UIPickerView, UIPickerViewDelegate,
UIPickerViewDataSource {

    private var componentModels: [PickerComponent<Item>]
    private let onItemSelected: (Item) -> Void

    public init(componentModels: [PickerComponent<Item>], onItemSelected: @escaping (Item) -> Void) {

        self.onItemSelected = onItemSelected
        self.componentModels = componentModels

        super.init(frame: .zero)

        self.delegate = self
        self.dataSource = self
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func scrollTo(item: Item, shouldSelect: Bool = false) {
        for (componentIndex, component) in self.componentModels.enumerated() {
            for (rowIndex, i) in component.items.enumerated() {
                if item.description == i.description {
                    self.selectRow(rowIndex, inComponent: componentIndex, animated: true)
                    if shouldSelect {
                        self.onItemSelected(item)
                    }
                    return
                }
            }
        }
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return self.componentModels.count
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let componentModel = self.componentModels[safe: component] else { return 0 }
        return componentModel.items.count
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        guard let componentModel = self.componentModels[safe: component],
            let item = componentModel.items[safe: row] else { return }

        self.onItemSelected(item)
        self.reloadAllComponents()
    }

    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }

    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        guard self.numberOfComponents(in: pickerView) > 0 else { return pickerView.frame.size.width }
        return pickerView.frame.size.width/CGFloat(self.numberOfComponents(in: pickerView))
    }

    public func pickerView(_ pickerView: UIPickerView,
                           viewForRow row: Int,
                           forComponent component: Int,
                           reusing view: UIView?) -> UIView {

        guard let componentModel = self.componentModels[safe: component],
            let item = componentModel.items[safe: row] else { return UIView() }

        let title = String(describing: item)
        return self.layoutPickerView(pickerView: pickerView,
                                     title: title,
                                     row: row,
                                     component: component)
    }

    public func layoutPickerView(pickerView: UIPickerView,
                                 title: String,
                                 row: Int,
                                 component: Int) -> UIView {

        return self.getView(with: title, for: component)
    }

    open func getView(with text: String, for component: Int) -> UIView {
        return UIView()
    }
}
