//
//  UIImage + ext.swift
//  TestApp
//
//  Created by Artur Avdeev on 26.12.2023.
//

import UIKit

extension UIImage {
    
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext()}
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
