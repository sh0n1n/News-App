//
//  TableCollectionViewSection.swift
//  NewsApp
//
//  Created by Melkor on 1/11/24.
//

import Foundation

protocol TableCollectionViewItemsProtocol { }

struct TableCollectionViewSection {
    var title: String?
    var items: [TableCollectionViewItemsProtocol]
}
