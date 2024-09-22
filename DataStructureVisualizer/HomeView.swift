//
//  HomeView.swift
//  DataStructureVisualizer
//
//  Created by Gokul P on 22/09/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                    NavigationLink(destination: {
                        SortVisualizer(sortModel: SortModel(maxHeight: geometry.size.height - 120))
                    }, label: {
                        Text("SortVisualizer")
                    })
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
