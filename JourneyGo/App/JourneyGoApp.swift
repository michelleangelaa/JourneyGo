//
//  JourneyGoApp.swift
//  JourneyGo
//
//  Created by Michelle Angela Aryanto on 19/05/24.
//

import SwiftUI

@main
struct JourneyGoApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
