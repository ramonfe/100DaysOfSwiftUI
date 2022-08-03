//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Ramon Felix on 02/08/22.
//

import PhotosUI
import SwiftUI
import Foundation

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
}
