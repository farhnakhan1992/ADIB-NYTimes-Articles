//
//  ArticleDetailPresenter.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 27/05/2021.
//

import Foundation


protocol ArticleDetailViewPresenter: AnyObject {
    init(view: ArticleDetailView)
    func viewDidLoad()
}

class ArticleDetailPresenter: ArticleDetailViewPresenter {
    
    // MARK: - Properties
    weak var view: ArticleDetailView?
    
    // MARK: - Protocol methods
    required init(view: ArticleDetailView) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
}

