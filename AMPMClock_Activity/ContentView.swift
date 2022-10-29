//
//  ContentView.swift
//  AMPMClock_Activity
//
//  Created by Payton Curry on 10/29/22.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State var activityId = ""
    @State var name = ""
    @State var testVar = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            TextField("Name", text: $name).textFieldStyle(.roundedBorder)
            Toggle("testVar", isOn: $testVar)
            Button {
                startActivity(name: name, testVar: testVar)
            } label: {
                Text("Start activity")
            }

        }
        .padding()
    }
    func startActivity(name: String, testVar: Bool) {
        let initialContentState = ClockAttributes.ContentState(testVar: testVar)
        let attributes = ClockAttributes(username: name)
        
        do {
            let activity = try Activity<ClockAttributes>.request(attributes: attributes, contentState: initialContentState)
            print("Requested a delivery Live Activity \(String(describing: activity.id)).")
            activityId = activity.id
        } catch (let err) {
            print("Error starting activity: \(err.localizedDescription)")
        }
    }
    func updateActivity(id: String, variable: Bool) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
