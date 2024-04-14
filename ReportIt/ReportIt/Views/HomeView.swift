//
//  HomeView.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 06/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    //Router for navigation
    @EnvironmentObject var router: Router
    
    let bugViewModel = AppRepository.shared.getBugViewModel()
    
    var body: some View {
        ZStack{
            //Backgroud color
            Color("Background")
            
            //Background image
            VStack{
                Image("HomeBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Utilities.screenWidth, height: Utilities.screenHeight * 0.7)
                Spacer()
            }
            
            VStack{
                
                //Logo
                HStack{
                    
                    Spacer()
                    
                    Image("ReportItLogo-light")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Utilities.screenWidth * 0.25, height: Utilities.screenHeight * 0.25)
                        .padding(.trailing, Utilities.screenWidth * 0.05)
                }
                
                //Header "You have reported"
                Text("You have reported")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundStyle(Color("FontColor1"))
                    .multilineTextAlignment(.center)
                
                BugWidget(bugsCount: bugViewModel.totalBugs)
                    .padding(.top, Utilities.screenHeight * 0.03)
                
                Spacer()
                
                //Report bug button
                Button(action: {
                    router.navigate(to: .ReportBug)
                }, label: {
                    Text("Report Bug")
                        .font(.system(size: 18))
                        .fontWeight(.black)
                        .foregroundStyle(Color("FontColor1"))
                        .frame(width: Utilities.screenWidth * 0.7, height: Utilities.screenHeight * 0.054)
                        .background(Color("PrimaryColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                })
                .padding(.bottom, Utilities.screenHeight * 0.12)
                
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
