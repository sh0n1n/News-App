//
//  GeneralCollectionViewCell.swift
//  NewsApp
//
//  Created by Melkor on 12/18/23.
//

import UIKit

final class GeneralCollectionViewCell: UICollectionViewCell {
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
       let view = UIImageView()
        
        return view
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemBackground
        view.alpha = 0
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.textColor = .systemBackground
        
        return label
    }
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
