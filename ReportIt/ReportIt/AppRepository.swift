//
//  AppRepository.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 09/04/2024.
//

import Foundation
import GoogleCloudKit

class AppRepository {
    static let shared = AppRepository()
    
    private let bugViewModel: BugViewModel
    private let authViewModel: AuthenticationViewModel
    
    private init() {
        self.bugViewModel = BugViewModel()
        self.authViewModel = AuthenticationViewModel()
    }
    
    func getBugViewModel() -> BugViewModel {
        return bugViewModel
    }
    
    func getAuthViewModel() -> AuthenticationViewModel {
        return authViewModel
    }
    
}

