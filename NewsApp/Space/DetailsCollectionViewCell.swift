//
//  DetailsCollectionViewCell.swift
//  NewsApp
//
//  Created by Melkor on 12/31/23.
//

import UIKit
import SnapKit

final class DetailsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "image")
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.text = "Title Here"
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Description should be here. Please, remove this mock text"
        label.numberOfLines = 2
        
        return label
    }()
    
    
}
