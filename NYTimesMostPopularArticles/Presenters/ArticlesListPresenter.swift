//
//  ArticlesListPresenter.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 26/05/2021.
//

import Foundation
import UIKit


// MARK: - Protocol methods
protocol ArticlesViewPresenter: AnyObject {
    init(view: ArticlesListView)
    func viewDidLoad()
   
}

class NYTimesArticlesListViewPresenter: ArticlesViewPresenter {
    
    // MARK: - Properties
    weak var view: ArticlesListView?
    var networkManager = NetworkManager()
    
    // MARK: - Protocol methods
    required init(view: ArticlesListView) {
        self.view = view
    }
    
    func viewDidLoad() {
        print("View notifies the Presenter that it has loaded.")
        if Reachability.isConnectedToNetwork(){
            fetchMostPopularArticles()
        }else{
            self.view?.showNetworkError(with: networkError)
        }
    }
    
    
    // MARK: - Private methods
    
    private func fetchMostPopularArticles() {
        networkManager.getPopularArticles { articlesArray, errorMsg in
            if errorMsg != nil{
                self.view?.fethingError(with: errorMsg ?? generalError)
                return
            }else{
                self.view?.reloadTableViewArticles(ArticlesArray: articlesArray)
            }
        }
    }
    
}
