//
//  Utilities.swift
//  ReportIt
//
//  Created by Taif Al.qahtani on 06/04/2024.
//

import Foundation
import UIKit

struct Utilities {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    static let dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss dd/MM/yyyy"
        return formatter
    }()
    
    static let dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    static func formatDateAndTime(_ date: Date) -> String {
        return dateFormatter1.string(from: date)
    }
    
    static func formatDate(_ date: Date) -> String {
        return dateFormatter2.string(from: date)
    }
    
    static func resizeImage(_ image: UIImage, to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        image.draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    static func applyCharacterLimit(to text: inout String, limit characterLimit: Int){
        if text.count > characterLimit {
            let excess = text.count - characterLimit
            let index = text.index(text.startIndex, offsetBy: characterLimit)
            text = String(text.prefix(upTo: index))
            print("Character limit reached. Excess: \(excess)")
        }
    }

}
