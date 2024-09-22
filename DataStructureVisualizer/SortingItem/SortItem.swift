//
//  SortItem.swift
//  DataStructureVisualizer
//
//  Created by Gokul P on 20/09/24.
//

import Foundation

struct SortItem: Identifiable, Hashable {
    var id = UUID()

    let value: Float
    var isChecking = false

    init(value: Float, isChecking: Bool = false) {
        self.value = value
        self.isChecking = isChecking
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(value)
        hasher.combine(isChecking)
    }

    static func == (lhs: SortItem, rhs: SortItem) -> Bool {
        lhs.id == rhs.id
        && lhs.value == rhs.value
        && lhs.isChecking == rhs.isChecking
    }
}
