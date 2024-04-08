//
//  Router.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 08/04/2024.
//

import Foundation
import SwiftUI



final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case Home
        case ReportBug
        case LatestBugs
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
