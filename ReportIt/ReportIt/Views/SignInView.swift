//
//  SignInView.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 14/04/2024.
//

import SwiftUI
import GoogleSignIn

struct SignInView: View {
    
    //Router for navigation
    @EnvironmentObject var router: Router
    
    let authViewModel = AppRepository.shared.getAuthViewModel()
    
    var body: some View {
        ZStack{
            
            Color("Background")
            
            VStack(alignment: .center) {
                
                Spacer(minLength: Utilities.screenHeight * 0.1)
                
                Image("ReportItLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Utilities.screenWidth * 0.3, height: Utilities.screenHeight * 0.3)
                
                Spacer()
                
                Text("Sign in")
                    .fontWeight(.black)
                    .foregroundColor(Color("FontColor2"))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                // 3
                GoogleSignInButton()
                    .padding()
                    .onTapGesture {
                        self.authViewModel.signInWithGoogle(){ success, error in
                            if success == true{
                                self.router.navigateBack()
                            }else{
                                
                            }
                        }
                    }
                
            }
        }
        .ignoresSafeArea()
    }
}


struct GoogleSignInButton: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    
    private var button = GIDSignInButton()
    
    func makeUIView(context: Context) -> GIDSignInButton {
        button.colorScheme = colorScheme == .dark ? .dark : .light
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        button.colorScheme = colorScheme == .dark ? .dark : .light
    }
}


#Preview {
    SignInView()
}
