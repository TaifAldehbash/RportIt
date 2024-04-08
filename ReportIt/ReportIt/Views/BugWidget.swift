//
//  BugWidget.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 08/04/2024.
//

import SwiftUI

struct BugWidget: View {
    
    //Router for navigation
    @EnvironmentObject var router: Router
    
    var bugsCount : Int
    
    var body: some View{
        ZStack{
            Image("Circle")
                .resizable()
                .frame(width: Utilities.screenWidth * 0.509, height: Utilities.screenHeight * 0.235)
            
            //Bugs count
            Text("\(bugsCount)\nBugs")
                .font(.system(size: 24))
                .fontWeight(.black)
                .foregroundStyle(Color("FontColor2"))
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .frame(width: Utilities.screenWidth * 0.4, height: Utilities.screenHeight * 0.2)
        }
        .onLongPressGesture {
            router.navigate(to: .LatestBugs)
        }
    }
}

#Preview {
    BugWidget(bugsCount: 0)
}
