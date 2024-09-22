//
//  SortVisualizer.swift
//  DataStructureVisualizer
//
//  Created by Gokul P on 19/09/24.
//

import SwiftUI

struct SortVisualizer: View {

    @State var sortModel: SortModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Image("sortbg")
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    VStack {
                        VStack {
                            Spacer()
                            HStack(alignment: .bottom, spacing: 0) {
                                ForEach(sortModel.sortItems.indices, id: \.self) { index in
                                    Rectangle()
                                        .fill(
                                            sortModel.sortItems[index].isChecking
                                                ? Color.red
                                                : .blue
                                        )
                                        .frame(
                                            width: sortModel.getItemWidth(geometry.size.width),
                                            height: CGFloat(sortModel.sortItems[index].value)
                                        )
                                        .animation(.default, value: sortModel.sortItems[index].value)
                                }
                            }
                            .frame(width: geometry.size.width)
                        }
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .onChange(of: horizontalSizeClass) {
                sortModel.maxHeight = geometry.size.height - 120
            }
        }

        .toolbar(content: {
            HStack {
                Button("Randomize") {
                    sortModel.randomizeArray()
                }
                .disabled(sortModel.isSorting)

                Button("Start Sorting") {
                    Task {
                        await sortModel.bubbleSort()
                    }
                }
                .disabled(sortModel.isSorting)
            }
        })
    }

    func getFillColour() {}
}

#Preview {
    let randomArray = (1...20).map { _ in Int.random(in: 10...100) }
    let sortItems = randomArray.map { SortItem(value: Float($0)) }
    SortVisualizer(sortModel: SortModel(maxHeight: 400, sortItems: sortItems))
}
