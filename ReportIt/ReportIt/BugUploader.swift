//
//  BugUploader.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 09/04/2024.
//

import Foundation
import GoogleCloudKit
import UIKit

class BugUploader {
   
    static let shared = BugUploader()
    
    let cloudStorageManager : CloudStorageManager
    let googleAPIManager : GoogleAPIManager
    
    private init() {
        // Initialize CloudStorageManager
        cloudStorageManager = GoogleCloudKit.initializeCloudStorageManager()
        // Initialize GoogleAPIManager
        googleAPIManager = GoogleCloudKit.initializeGoogleAPIManager()
    }
    
    func uploadBugData(_ bug: BugDataModel, completion: @escaping (Bool, String?, Error?) -> Void) {
        let sheetTabName = Utilities.formatDate(Date())
        
        createNewSheetTab(name: sheetTabName) { result, error in
            guard let error = error else {
                self.uploadBugImage(bug.image ?? UIImage()) { success, imageUrl, error in
                    guard let error = error else {
                        self.googleAPIManager.uploadDataToGoogleSheets(sheetName: sheetTabName, data: [[bug.id, bug.label, bug.description, bug.priority, bug.date, imageUrl ?? ""]]) { result, error in
                            completion(result, imageUrl, error)
                        }
                        return
                    }
                    completion(false, nil, error)
                }
                return
            }
            completion(false, nil, error)
        }
    }
    
    private func uploadBugImage(_ bugImage: UIImage, completion: @escaping (Bool, String?, Error?) -> Void) {
        cloudStorageManager.uploadImage(bugImage) { imageUrl, error in
            if let error = error {
                completion(false, nil, error)
            } else {
                completion(true, "\(imageUrl!)", nil)
            }
        }
    }

    private func checkSheetTabExists(name: String, completion: @escaping (Bool, Error?) -> Void) {
        googleAPIManager.checkSheetExists(sheetName: name) { exists, error in
            completion(exists, error)
        }
    }
    
    private func createNewSheetTab(name: String, completion: @escaping (Bool, Error?) -> Void) {
        checkSheetTabExists(name: name) { exists, error in
            guard exists else {
                self.googleAPIManager.createSheetTab(title: name) { result, error in
                    guard result else {
                        completion(false, error)
                        return
                    }
                    self.googleAPIManager.uploadDataToGoogleSheets(sheetName: name, data: [["ID", "Label", "Description", "Priority", "Date", "Attachments"]]) { result, error in
                        completion(result, error)
                    }
                }
                return
            }
            completion(true, nil)
        }
    }
}
