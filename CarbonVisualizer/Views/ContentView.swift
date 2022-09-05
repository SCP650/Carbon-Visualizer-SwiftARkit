//
//  ContentView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/2/22.
//

import SwiftUI


struct ContentView : View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage{
        case .home:
            HomeView()
        case .visualize:
            VisualizerView()
        case .calculate:
            CalculatorView().environmentObject(viewRouter)
        }
    }
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
    
    func reset() {
        self.currentPage = .home
    }
}

enum Page {
    case home
    case calculate
    case visualize

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
