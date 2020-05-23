//
//  GalleryCell.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 21.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//

protocol GalleryCellViewModel {
    var url: String { get }
    var id: String { get }
    var width: Int { get }
    var height: Int { get }
}

import UIKit

class GalleryCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    func setup(model: GalleryViewModel.Cell) {
        self.photoImageView?.downloaded(from: model.url)
    }
    
}
