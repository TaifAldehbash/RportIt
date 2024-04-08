//
//  BugDataModel.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 08/04/2024.
//

import SwiftUI

struct BugDataModel: Identifiable{
    var id: UUID = UUID()
    
    let description: String
    let imageUrl: String
    let date: Date
    
    init(description: String, imageUrl: String, date: Date) {
        self.description = description
        self.imageUrl = imageUrl
        self.date = date
    }
}
