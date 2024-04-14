//
//  ReportItApp.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 03/04/2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct ReportItApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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
                            case .SignIn:
                                SignInView().navigationBarBackButtonHidden(true)
                        }
                    }
            }
            .environmentObject(router)
            .navigationViewStyle(.stack)
        }
    }
}
