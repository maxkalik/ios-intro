//
//  PhotoCell.swift
//  PhotoCollection
//
//  Created by Maksim Kalik on 8/14/22.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    static let identifier = "PhotoCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        imageView.image = nil
    }
    
    func configure(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
