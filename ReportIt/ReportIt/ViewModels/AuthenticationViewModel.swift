//
//  AuthenticationViewModel.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 13/04/2024.
//

import Firebase
import GoogleCloudKit
import GoogleSignIn
//import GoogleSignIn

class AuthenticationViewModel: ObservableObject {

    enum SignInState {
        case signedIn
        case signedOut
    }

    @Published var state: SignInState = .signedOut
    
    let googleAPIManager : GoogleAPIManager
    
    init() {
        // Initialize GoogleAPIManager
        googleAPIManager = GoogleCloudKit.initializeGoogleAPIManager()
    }
    
    func signInWithGoogle(completion: @escaping (Bool, Error?) -> Void) {
        googleAPIManager.signInWithGoogle { accessToken, error in
            if let error = error {
                completion(false, error)
            } else if let accessToken = accessToken {
                print(accessToken)
                self.setAccessToken(accessToken: accessToken)
                self.state = .signedIn
                completion(true, nil)
            } else {
                // Handle unexpected scenario where both accessToken and error are nil
                completion(false, NSError(domain: "AuthenticationError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"]))
            }
        }
    }
    
    func setAccessToken(accessToken: String) {
        self.googleAPIManager.setAccessToken(accessToken)
    }
}

