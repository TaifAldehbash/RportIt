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
    
    @State private var bugLabel: String = ""
    @State private var bugDesc: String = ""
    @State private var bugPriority: Priority = .Unspecified
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker: Bool = false
    @State private var isShowingActionSheet: Bool = false
    @State private var isDescValid: Bool = true
    @State private var isImageSelected: Bool = true
    
    let bugViewModel = AppRepository.shared.getBugViewModel()
    let authViewModel = AppRepository.shared.getAuthViewModel()
    
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
                    .foregroundStyle(isDescValid ?  Color("FontColor2") : Color.red)
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
                }
                .padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.1, bottom: Utilities.screenHeight * 0.03, trailing: 0))
                
                //Field label "Attach image"
                Text("Attach image")
                    .font(.system(size: 18))
                    .foregroundStyle(isImageSelected ?  Color("FontColor2") : Color.red)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.1, bottom: Utilities.screenHeight * 0.01, trailing: 0))
                
                if let image = selectedImage {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        .frame(width: Utilities.screenWidth * 0.79, height: Utilities.screenHeight * 0.16)
                        
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: Utilities.screenWidth * 0.79, height: Utilities.screenHeight * 0.16)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(EdgeInsets(top: 0, leading: Utilities.screenWidth * 0.1, bottom: Utilities.screenHeight * 0.03, trailing: 0))
                    
                } else{
                //Attach image button
                Button(action: {
                    // Show action sheet to choose capture or select image
                    isShowingActionSheet = true
                }, label: {
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
                .actionSheet(isPresented: $isShowingActionSheet) {
                    ActionSheet(
                        title: Text("Attach Image"),
                        buttons: [
                            .default(Text("Choose Image"), action: {
                                // Show image picker
                                isShowingImagePicker = true
                            }),
                            .default(Text("Capture Screenshot"), action: {
                                // Capture screenshot
                                selectedImage = ImagePicker.captureScreenshot()
                            }),
                            .cancel()
                        ]
                    )
                }
                .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage)
                }
                }
                Spacer()
                
                //Submit bug button
                HStack {
                    Spacer()
                    Button(action: {
                        let result = submitBug()
                        if result {
                            router.navigateBack()
                        }
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
                }
                .padding(.bottom, Utilities.screenHeight * 0.1)
            }
            
        }
        .ignoresSafeArea()
        .onTapGesture {
            // Dismiss the keyboard when tapped outside of the text field
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    
    func loadImage() {
        // Load image selected from image picker
    }
    
    func submitBug() -> Bool {
        guard let selectedImage = selectedImage, !bugDesc.isEmpty else {
            self.isImageSelected = selectedImage != nil
            self.isDescValid = !bugDesc.isEmpty
            return false
        }
        
        if authViewModel.state == .signedOut {
            self.router.navigate(to: .SignIn)
            return false
        }
        
        bugViewModel.submitBug(label: bugLabel, description: bugDesc, priority: bugPriority, image: selectedImage) { success, error in
            if let error = error {
                debugPrint(error)
                if error.localizedDescription == "Access token is missing" {
                    authViewModel.state = .signedOut
                    self.router.navigate(to: .SignIn)
                }
            }
        }
        
        return true
    }

}

#Preview {
    ReportBugView()
}
