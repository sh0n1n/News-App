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
        
        
        view.image = UIImage(named: "image") ?? UIImage.add
        
        return view
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemGray4
        view.alpha = 0.5
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.textColor = .white
        
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
    
    // MARK: - Methods
    func set(article: ArticleCellViewModel) {
        titleLabel.text = article.title
        
        if let data = article.imageData,
           let image = UIImage(data: data){
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "image")
        }
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
            make.height.equalTo(50)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.trailing.leading.equalTo(blackView).offset(5)
            make.top.bottom.equalTo(blackView)
        }
    }
}
