//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Melkor on 12/25/23.
//

import UIKit

final class NewsViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView = UIView()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "image")
        
        return view
    }()
}
