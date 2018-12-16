//
//  UIImage+Thumbnail.swift
//  UIImageThumbnail
//
//  Created by Toomas Vahter on 16/12/2018.
//  Copyright © 2018 Augmented Code.
//  MIT license.
//

import UIKit

extension UIImage {
    convenience init?(thumbnailOfURL url: URL, size: CGSize, scale: CGFloat) {
        let options = [kCGImageSourceShouldCache: false] as CFDictionary
        guard let source = CGImageSourceCreateWithURL(url as CFURL, options) else { return nil }
        let targetDimension = max(size.width, size.height) * scale
        let thumbnailOptions = [kCGImageSourceCreateThumbnailFromImageAlways: true,
                                kCGImageSourceCreateThumbnailWithTransform: true,
                                kCGImageSourceShouldCacheImmediately: true,
                                kCGImageSourceThumbnailMaxPixelSize: targetDimension] as CFDictionary
        guard let thumbnail = CGImageSourceCreateThumbnailAtIndex(source, 0, thumbnailOptions) else { return nil }
        self.init(cgImage: thumbnail)
    }
}
