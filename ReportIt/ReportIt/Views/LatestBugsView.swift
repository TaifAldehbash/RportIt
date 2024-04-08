//
//  LatestBugsView.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 08/04/2024.
//

import SwiftUI

struct LatestBugsView: View {
    
    //Router for navigation
    @EnvironmentObject var router: Router
    
    var recentBugs: [BugDataModel] = [BugDataModel(description: "In the contact form, pressing 'Enter' triggers the send button instead of creating a new line.", imageUrl: "https://www.tabnine.com/blog/wp-content/uploads/2023/02/Screen-Shot-2023-02-05-at-13.22.01.png", date: Date()), BugDataModel(description: "In the contact form, pressing 'Enter' triggers the send button instead of creating a new line.", imageUrl: "https://www.tabnine.com/blog/wp-content/uploads/2023/02/Screen-Shot-2023-02-05-at-13.22.01.png", date: Date()), BugDataModel(description: "In the contact form, pressing 'Enter' triggers the send button instead of creating a new line.", imageUrl: "https://www.tabnine.com/blog/wp-content/uploads/2023/02/Screen-Shot-2023-02-05-at-13.22.01.png", date: Date())]
    
    var body: some View {
        ZStack{
            //Backgroud color
            Color("Background")
            
            VStack{
                //Back button stack
                HStack{
                    
                    //Back button
                    Button(action: {
                        router.navigateBack()
                    }, label: {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .frame(width: Utilities.screenWidth * 0.0636, height: Utilities.screenHeight * 0.0293)
                            .foregroundStyle(Color("PrimaryColor"))
                        
                    })
                    .padding(EdgeInsets(top: Utilities.screenHeight * 0.07, leading: Utilities.screenWidth * 0.07, bottom: Utilities.screenHeight * 0.04, trailing: 0))
                    
                    Spacer()
                }
                
                //Header "Latest Reported Bugs"
                HStack {
                    Text("Latest Reported Bugs")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundStyle(Color("FontColor2"))
                        .multilineTextAlignment(.leading)
                        .padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.1, bottom: Utilities.screenHeight * 0.04, trailing: 0))
                    
                    Spacer()
                }
                
                //Bug details list
                ScrollView (showsIndicators: false){
                    ForEach(recentBugs){bug in
                        BugDetailsView(description: bug.description, imageUrl: bug.imageUrl, date: bug.date)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: Utilities.screenHeight * 0.03, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: Utilities.screenHeight * 0.03, trailing: 0))
                }
                
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LatestBugsView()
}


