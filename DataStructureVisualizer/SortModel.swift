//
//  SortModel.swift
//  DataStructureVisualizer
//
//  Created by Gokul P on 19/09/24.
//
import Observation

/// Model to represent the sort state
@Observable
class SortModel {
    let itemCount = 20
    var sortItems: [SortItem]
    var isSorting = false
    var maxHeight: Double

    init(maxHeight: Double, sortItems: [SortItem] = []) {
        self.sortItems = sortItems
        self.maxHeight = maxHeight
        randomizeArray()
    }
    
    func randomizeArray() {
        let randomArray = (1...itemCount)
            .map { _ in Int.random(in: 10...Int(maxHeight)) }
        let sortItems = randomArray.map { SortItem(value: Float($0)) }
        resetArray(with: sortItems)
    }

    func resetArray(with sortItems: [SortItem]) {
        self.sortItems = sortItems
    }
    
    func getItemWidth(_ viewWidth: Double) -> Double {
        return (viewWidth - Double((itemCount * 2))) / Double(itemCount)
    }

    /// Bubble Sort Algorithm with delay for visualization
    func bubbleSort() async {
        isSorting = true
        let n = sortItems.count
        for i in 0..<n {
            for j in 0..<n - i - 1 {
                sortItems[j].isChecking = true
                for _ in 0...3_000_00 {}
                if sortItems[j].value > sortItems[j + 1].value {
                    let temp = sortItems[j]
                    sortItems[j] = sortItems[j + 1]
                    sortItems[j + 1] = temp
                    sortItems[j + 1].isChecking = false
                } else {
                    sortItems[j].isChecking = false
                }
            }
        }
        isSorting = false
    }
}
