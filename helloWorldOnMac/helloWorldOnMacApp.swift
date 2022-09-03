//
//  helloWorldOnMacApp.swift
//  helloWorldOnMac
//
//  Created by 山本祐太 on 2022/09/03.
//

import SwiftUI

@main
struct helloWorldOnMacApp: App {
  let windowTitle: String = "INTERVAL TIMER"
  var body: some Scene {
    WindowGroup {
      ContentView().navigationTitle(windowTitle)
    }
  }
}
