//
//  GeneralCollectionViewCell.swift
//  NewsApp
//
//  Created by Melkor on 12/18/23.
//

import UIKit
import SnapKit

final class GeneralCollectionViewCell: UICollectionViewCell {
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
       let view = UIImageView()
        
        view.image = UIImage(named: "Image") ?? UIImage.add
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
    }()
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubview(imageView)
        addSubview(blackView)
        addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.size.edges.equalToSuperview()
        }
        
        blackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(blackView)
            make.leading.trailing.equalTo(blackView).offset(5)
        }
    }
}
