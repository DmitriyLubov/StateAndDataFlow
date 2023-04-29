//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Hi, \(userSettings.name)")
                .font(.largeTitle)
            
            Spacer()
            
            Text(timer.counter.formatted())
                .font(.largeTitle)
            
            Spacer()
            
            ButtonView(title: timer.buttonTitle, color: .red) {
                timer.startTimer()
            }
            .padding(.bottom, 200)
            
            Spacer()
            
            ButtonView(title: "LogOut", color: .blue) {
                userSettings.name = ""
                userSettings.isLoggedIn.toggle()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())
    }
}


