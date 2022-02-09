//
//  ArithmeticAceApp.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-07.
//

import SwiftUI

@main
struct ArithmeticAceApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView {
                //tabs
                MultiplicationView()
                    .tabItem {
                        Image(systemName: "multiply.circle")
                        Text("Multiply")
                    }
                DivisionView()
                    .tabItem {
                        Image(systemName: "divide.circle")
                        Text("Division")
                    }
                AdditionView()
                    .tabItem {
                        Image(systemName: "plus.circle")
                        Text("Addition")
                        
                        
                    }
                SubtractionView()
                    .tabItem {
                        Image(systemName: "minus.circle")
                        Text("Subtration")
                    }
            }
        }
    }
}
