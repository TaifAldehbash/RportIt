//
//  BugDataModel.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 08/04/2024.
//

import SwiftUI

struct BugDataModel: Identifiable{
    var id: UUID = UUID()
    
    let label: String
    let description: String
    let priority: Priority
    var imageUrl: String?
    let image: UIImage?
    let date: Date
    
    init(label: String = "", description: String, priority: Priority = .Unspecified,imageUrl: String = "", image: UIImage = UIImage(),date: Date) {
        self.label = label
        self.description = description
        self.priority = priority
        self.imageUrl = imageUrl
        self.image = image
        self.date = date
    }
}

enum Priority : String{
    case High = "High"
    case Medium = "Medium"
    case Low = "Low"
    case Unspecified = "Unspecified"
}
