//
//  ReportItApp.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 03/04/2024.
//

import SwiftUI

@main
struct ReportItApp: App {
    
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                LaunchView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                            case .Home:
                                HomeView().navigationBarBackButtonHidden(true)
                            case .ReportBug:
                                ReportBugView().navigationBarBackButtonHidden(true)
                            case .LatestBugs:
                                LatestBugsView().navigationBarBackButtonHidden(true)
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
