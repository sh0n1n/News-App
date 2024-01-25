//
//  TechnologyCollectionViewCell.swift
//  NewsApp
//
//  Created by Melkor on 1/17/24.
//

import UIKit
import SnapKit

final class TechnologyCollectionViewCell: UICollectionViewCell {
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "image")
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var blackView: UIView = {
        let titleFrame = UIView()
        titleFrame.backgroundColor = .systemGray4
                
        titleFrame.layer.shadowColor = UIColor.lightGray.cgColor
        titleFrame.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        titleFrame.layer.shadowRadius = 1
        titleFrame.layer.shadowOpacity = 0.8
        
        return titleFrame
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var datePublic: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13)
        
        return label
    }()
    
    // Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        blackView.layer.shadowPath = UIBezierPath(roundedRect: blackView.bounds, cornerRadius: 12).cgPath
    }
    
    // MARK: Methods
    func set(article: ArticleCellViewModel) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        datePublic.text = article.date
        
        if let data = article.imageData,
           let image = UIImage(data: data) {
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
        } else {
            imageView.image = UIImage(named: "Image")
        }
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(blackView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(datePublic)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            let widthSize = self.frame.width / 3
            
            make.width.equalTo(widthSize)
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        blackView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalTo(imageView.snp.trailing).offset(5)
            make.top.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.edges.size.equalTo(blackView).inset(5)
            make.leading.equalTo(blackView.snp.leading)
            make.trailing.equalToSuperview().inset(5)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(blackView.snp.bottom).offset(5)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(5)
        }
        
        datePublic.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}
