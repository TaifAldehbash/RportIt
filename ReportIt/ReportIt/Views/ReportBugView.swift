//
//  ReportBugView.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 08/04/2024.
//

import SwiftUI

struct ReportBugView: View {
    
    //Router for navigation
    @EnvironmentObject var router: Router
    
    @State private var bugDesc: String = ""
    
    var body: some View {
        ZStack{
            //Backgroud color
            Color("Background")
            
            VStack (alignment: .leading){
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
                
                
                //Header "Report Bug"
                Text("Report Bug")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundStyle(Color("FontColor2"))
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.1, bottom: Utilities.screenHeight * 0.04, trailing: 0))
                
                //Field label "Describe the problem"
                Text("Describe the problem")
                    .font(.system(size: 18))
                    .foregroundStyle(Color("FontColor2"))
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.1, bottom: Utilities.screenHeight * 0.01, trailing: 0))
                
                //Bud description text field
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        .frame(width: Utilities.screenWidth * 0.79, height: Utilities.screenHeight * 0.16)

                    TextEditor(text: $bugDesc)
                        .frame(width: Utilities.screenWidth * 0.78, height: Utilities.screenHeight * 0.15)
                        .font(.system(size: 18))
                        .cornerRadius(15)
                        .onChange(of: bugDesc, initial: false) { _, _ in
                            Utilities.applyCharacterLimit(to: &bugDesc, limit: 160)
                        }
                }.padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.1, bottom: Utilities.screenHeight * 0.03, trailing: 0))
                
                //Field label "Attach image"
                Text("Attach image")
                    .font(.system(size: 18))
                    .foregroundStyle(Color("FontColor2"))
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.1, bottom: Utilities.screenHeight * 0.01, trailing: 0))
                
                //Attach image button
                Button(action: {}, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        .frame(width: Utilities.screenWidth * 0.79, height: Utilities.screenHeight * 0.16)
                        
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: Utilities.screenWidth * 0.17, height: Utilities.screenHeight * 0.063)
                            .foregroundStyle(Color.gray)
                    }
                })
                .padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.1, bottom: Utilities.screenHeight * 0.03, trailing: 0))
                
                Spacer()
                
                //Submit bug button
                HStack {
                    Spacer()
                    Button(action: {
                        //Action to be added
                    }, label: {
                        Text("Submit Bug")
                            .font(.system(size: 18))
                            .fontWeight(.black)
                            .foregroundStyle(Color("FontColor1"))
                            .frame(width:  Utilities.screenWidth * 0.79, height: Utilities.screenHeight * 0.054)
                            .background(Color("PrimaryColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    })
                    
                    Spacer()
                }.padding(.bottom, Utilities.screenHeight * 0.1)
            }
            
        }.ignoresSafeArea()
    }
}

#Preview {
    ReportBugView()
}
