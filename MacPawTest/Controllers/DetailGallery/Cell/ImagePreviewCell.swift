//
//  ImagePreviewCell.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 22.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//


import UIKit

class  ImagePreviewCell: UICollectionViewCell, UIScrollViewDelegate {
    
    static let reuseId = "PhotoCell"
    
    let photoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false // чтобы фиксировать данный елемент на ячейке
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let scrollImage:UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = false
        scroll.alwaysBounceHorizontal = false
        scroll.showsVerticalScrollIndicator = true
        scroll.flashScrollIndicators()
        scroll.minimumZoomScale = 1
        scroll.maximumZoomScale = 1
        
        let doubleTapGest = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapScrollView(recognizer:)))
        doubleTapGest.numberOfTouchesRequired = 2
        scroll.addGestureRecognizer(doubleTapGest)
        return scroll
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollImage.delegate = self
        self.addSubview(scrollImage)
        scrollImage.addSubview(photoImageView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        scrollImage.setZoomScale(1, animated: true)
        photoImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollImage.frame = self.bounds
        photoImageView.frame = self.bounds
    }
    
    func setup(model: GalleryViewModel.Cell) {
        self.photoImageView.downloaded(from: model.url)
    }
    
    @objc func handleDoubleTapScrollView(recognizer:UITapGestureRecognizer) {
        
        if scrollImage.zoomScale == 1{
            scrollImage.zoom(to: zoomRectForScale(scale: scrollImage.maximumZoomScale, center: recognizer.location(in: recognizer.view)), animated: true)
        }else{
            scrollImage.setZoomScale(1, animated: true)
        }
    }
    
    private func zoomRectForScale(scale:CGFloat,center:CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = photoImageView.frame.size.height / scale
        zoomRect.size.width = photoImageView.frame.size.width / scale
        let newCenter = photoImageView.convert(center, from: scrollImage)
        zoomRect.origin.x  = newCenter.x - (zoomRect.size.width / 2)
        zoomRect.origin.y  = newCenter.y - (zoomRect.size.height / 2)
        return zoomRect
    }
    
    private func viewFromZooming(in scrollView:UIScrollView) -> UIView? {
        return self.photoImageView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
