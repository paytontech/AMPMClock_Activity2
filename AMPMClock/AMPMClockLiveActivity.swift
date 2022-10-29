//
//  AMPMClockLiveActivity.swift
//  AMPMClock
//
//  Created by Payton Curry on 10/29/22.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct AMPMClockAttributes: ActivityAttributes {
    typealias ClockContentState = ContentState
    public struct ContentState: Codable, Hashable {
        var testVar: Bool
    }
    var username: String
}

struct AMPMClockLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: AMPMClockAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                    Text("Hello, \(context.attributes.username)!")
                    Text("testVar: \(String(context.state.testVar))")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
