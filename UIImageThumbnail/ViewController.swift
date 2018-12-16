//
//  ViewController.swift
//  UIImageThumbnail
//
//  Created by Toomas Vahter on 16/12/2018.
//  Copyright © 2018 Augmented Code.
//  MIT license.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadThumbnailImage() // App memory usage: 7 MB
        //loadEntireImage() // App memory usage: 28 MB
    }
    
    private func loadThumbnailImage() {
        let size = imageView.bounds.size
        let scale = traitCollection.displayScale
        let url = Bundle.main.url(forResource: "Wallpaper", withExtension: "jpg")!
        DispatchQueue.global(qos: .userInitiated).async {
            let image = UIImage(thumbnailOfURL: url, size: size, scale: scale)!
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = image
            }
        }
    }
    
    private func loadEntireImage() {
        let url = Bundle.main.url(forResource: "Wallpaper", withExtension: "jpg")!
        DispatchQueue.global(qos: .userInitiated).async {
            let image = UIImage(contentsOfFile: url.path)
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = image
            }
        }
    }
}
