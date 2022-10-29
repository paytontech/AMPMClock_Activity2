//
//  Attributes.swift
//  AMPMClock_Activity
//
//  Created by Payton Curry on 10/29/22.
//

import Foundation
import ActivityKit

struct ClockAttributes: ActivityAttributes {
    typealias ClockContentState = ContentState
    public struct ContentState: Codable, Hashable {
        var testVar: Bool
    }
    var username: String
}
