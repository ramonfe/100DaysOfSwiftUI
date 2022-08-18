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
    @Binding var image: UIImage?
        
    class Coordinator: NSObject, PHPickerViewControllerDelegate{
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            //tell picker go away
            picker.dismiss(animated: true)
            //exit if no selection is made
            guard let provider = results.first?.itemProvider else {return}
            
            //if this has an image we can use it
            if provider.canLoadObject(ofClass: UIImage.self){
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
}
