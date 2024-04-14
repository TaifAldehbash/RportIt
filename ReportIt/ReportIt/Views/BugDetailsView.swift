//
//  BugDetailsView.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 08/04/2024.
//

import SwiftUI

struct BugDetailsView: View {
    
    var description : String
    var imageUrl : String
    var date : Date
    
    var body: some View {
        ZStack{
            VStack{
                //Date Label
                HStack{
                    
                    Spacer()
                    
                    Text(Utilities.formatDate(date))
                        .font(.system(size: 15))
                        .foregroundColor(Color("FontColor3"))
                        .padding(EdgeInsets(top: Utilities.screenHeight * 0.03, leading: 0, bottom: Utilities.screenHeight * 0.01, trailing: Utilities.screenWidth * 0.05))
                }
                
                //Bug description
                Text(description)
                    .font(.system(size: 15))
                    .foregroundColor(Color("FontColor3"))
                    .frame(width: Utilities.screenWidth * 0.78, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.05, bottom: Utilities.screenHeight * 0.03, trailing: Utilities.screenWidth * 0.05))
                
                AsyncImage(url: URL(string: imageUrl)){ image in
                    image.resizable()
                }placeholder: {
                    ProgressView()
                }
                .frame(width: Utilities.screenWidth * 0.78, height: Utilities.screenHeight * 0.157)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.05, bottom: Utilities.screenHeight * 0.03, trailing: Utilities.screenWidth * 0.05))
                
            }
        }
        .frame(width: Utilities.screenWidth * 0.85)
        .background(Color("SecondaryColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 2, y: 4)
    }
}

#Preview {
    BugDetailsView(description: "", imageUrl: "", date: Date())
}
