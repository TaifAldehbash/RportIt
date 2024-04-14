//
//  BugViewModel.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 09/04/2024.
//

import Foundation
import SwiftUI

class BugViewModel: ObservableObject {
    @Published var bugs: [BugDataModel] = []
    @Published var totalBugs: Int = 0
    @Published var recentBugs: [BugDataModel] = []
    
    private let bugUploader =  BugUploader.shared
        
    func submitBug(label: String, description: String, priority: Priority, image: UIImage, completion: @escaping (Bool, Error?) -> Void){
        var newBug = BugDataModel(description: description, image: image, date: Date())
        
        bugs.append(newBug)
        
        // Upload bug data to Google Sheets
        bugUploader.uploadBugData(newBug) { result, imageUrl, error  in
            if result == true{
                
                newBug.imageUrl = imageUrl
                
                // Update total number of bugs
                self.totalBugs += 1
                
                // Update recent bugs
                self.recentBugs.insert(newBug, at: 0)
                if self.recentBugs.count > 3 {
                    self.recentBugs.removeLast()
                }
                
                completion(true, nil)
                
            }else{
                // Handle failure
                debugPrint("Failed to upload bug: \(String(describing: error))")
                completion(false, error)
            }
            
        }
    }
}

