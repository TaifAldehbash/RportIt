//
//  LaunchView.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 06/04/2024.
//

import SwiftUI

struct LaunchView: View {
    
    //Router for navigation
    @EnvironmentObject var router: Router
    
    //Animation
    @State var splachAnimation: Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack{
            if !splachAnimation {
                
                Color("Background")
                
                VStack(alignment: .center) {
                    
                    Spacer(minLength: Utilities.screenHeight * 0.3)
                    
                    Image("ReportItLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Utilities.screenWidth * 0.3, height: Utilities.screenHeight * 0.3)
                        .scaleEffect(splachAnimation ? 35 : 1)
                    
                    Spacer()
                    
                    
                    Image("ReportItLogo2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Utilities.screenWidth * 0.4, height: Utilities.screenHeight * 0.3)
                    
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 0.3)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            //Animation after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    print("width : \(Utilities.screenWidth) hieght : \(Utilities.screenHeight)")
                    self.splachAnimation = true
                    router.navigate(to: .Home)
                }
            }
        }
    }
}

#Preview {
    LaunchView()
}
