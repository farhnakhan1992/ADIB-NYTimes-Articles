//
//  NYTimesArticlesListViewController.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 26/05/2021.
//

import UIKit

// MARK: - Protocols

protocol ArticlesListView: AnyObject {
    func fethingError(with msg:String)
    func showNetworkError(with msg:String)
    func reloadTableViewArticles(ArticlesArray: [PopularArticles]?)
}
class NYTimesArticlesListViewController: UIViewController {

    // MARK: - Properties
    var presenter: NYTimesArticlesListViewPresenter!
    var mostPopularArticlesArray = [PopularArticles]()
    var tempMostPopularArticlesArray = [PopularArticles]()
    private static let CellIdentifier = "ArticleCell"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lblPlaceHolder: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.presenter.viewDidLoad()
    }
}

// MARK: - TableView Delegates & DataSource

extension NYTimesArticlesListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // tableView.isHidden = self.mostPopularArticlesArray.isEmpty
        self.lblPlaceHolder.isHidden = !self.mostPopularArticlesArray.isEmpty
        return mostPopularArticlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NYTimesArticlesListViewController.CellIdentifier, for: indexPath) as? ArticleListingCustomTableViewCell else {
            return ArticleListingCustomTableViewCell()
        }
        if indexPath.row < mostPopularArticlesArray.count {
            cell.setupCell(with: mostPopularArticlesArray[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < mostPopularArticlesArray.count {
            self.navigateToArticleDetailVC(with: mostPopularArticlesArray[indexPath.row])
        }
    }
}

// MARK: - View Protocol

extension NYTimesArticlesListViewController : ArticlesListView{
    func fethingError(with msg: String) {
        DispatchQueue.main.async {
            self.lblPlaceHolder.text = msg
            ShowAlertViewOnTop(msg: msg)
        }
    }
    
    func showNetworkError(with msg: String) {
        DispatchQueue.main.async {
            self.lblPlaceHolder.text = msg
            ShowAlertViewOnTop(msg: msg)
        }
    }
    
    func reloadTableViewArticles(ArticlesArray: [PopularArticles]?) {
        self.mostPopularArticlesArray = ArticlesArray ?? [PopularArticles]()
        self.mostPopularArticlesArray = self.mostPopularArticlesArray.sorted(by: { ($0.published_date ?? "") > ($1.published_date ?? "") })
        self.tempMostPopularArticlesArray = self.mostPopularArticlesArray
        DispatchQueue.main.async {
            self.tableView.reloadData()
            UIView.animate(withDuration: 0.5) {
                self.tableView.alpha = 1
            }
        }
    }
}
// MARK: -  Private Functions
extension NYTimesArticlesListViewController {
    
    private func setupUI(){
        self.tableView.alpha = 0
        self.view.backgroundColor = .black
        self.title = "NY Times Most Popular"
        self.tableView.tableFooterView = UIView()
        self.lblPlaceHolder.text = "Please waiting...\nNYTimes loading your articles..."
    }
    private func navigateToArticleDetailVC(with object: PopularArticles?){
        guard let vc =  UIStoryboard.Articles.get(NYTimesArticleDetailViewController.self) else {return}
        let presenter = ArticleDetailPresenter(view: vc)
        vc.presenter = presenter
        self.resetSearhBar()
        //i can stop user here also if object is nil or have some other issues, but just for validation for nill values i am taking to the next screen
        //if you pass nil in vc.currentArticleObject = nil the next screen will still work with proper error handling
        //that's why i kept as optional.
        vc.currentArticleObject = object
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    private func filterAsPerSearch(searchText: String){
        mostPopularArticlesArray = tempMostPopularArticlesArray.filter { $0.title?.localizedCaseInsensitiveContains(searchText) == true
           || $0.section?.localizedCaseInsensitiveContains(searchText) == true
           || $0.byline?.localizedCaseInsensitiveContains(searchText) == true
         }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func resetSearhBar()
    {
        self.searchBar.resignFirstResponder()
        self.searchBar.text = nil
        self.mostPopularArticlesArray = self.tempMostPopularArticlesArray
        DispatchQueue.main.async {
            self.tableView.reloadData()
           
        }
    }
}


// MARK: - Search bar delegates

extension NYTimesArticlesListViewController : UISearchBarDelegate
{
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text?.count ?? 0) > 1{
            self.filterAsPerSearch(searchText: searchBar.text ?? "")
        }else{
            self.resetSearhBar()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        if searchText == "" {
            self.resetSearhBar()
        }else{
            self.filterAsPerSearch(searchText: searchText)
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.resetSearhBar()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            searchBar.setShowsCancelButton(true, animated: true)
        }
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.resetSearhBar()
        DispatchQueue.main.async {
            searchBar.setShowsCancelButton(false, animated: true)
        }
     
    }
    
}
