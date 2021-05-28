//
//  NYTimesArticleDetailViewController.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 26/05/2021.
//

import UIKit
import SafariServices


// MARK: - Protocols
protocol ArticleDetailView: AnyObject {
   
}

class NYTimesArticleDetailViewController: UIViewController {

    // MARK: - Properties
    static let cellIdentifier = "DetailedCell"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblPlaceHolder: UILabel!
    @IBOutlet weak var btnReadFullArticleOutlet: UIButton!
    
    var presenter: ArticleDetailPresenter!
    var currentArticleObject: PopularArticles?
  
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI(with: currentArticleObject)
    }
    
    // MARK: - Button Actions
    @IBAction func btnReadArticleClicked(_ sender: Any) {
        self.readFullArticle()
    }
    
    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func shareBtnClicked(btn: UIBarButtonItem){
        guard let url = URL.init(string: self.currentArticleObject?.url ?? "") else {return}
        let item = [url]
        let activityViewController = UIActivityViewController(activityItems: item, applicationActivities: nil)
        if UIDevice.current.userInterfaceIdiom == .pad {
            activityViewController.popoverPresentationController?.barButtonItem = btn
        }
        DispatchQueue.main.async {
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    func readFullArticle() {
        guard let finalURL = URL.init(string: self.currentArticleObject?.url ?? "") else {return}
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: finalURL, configuration: config)
        DispatchQueue.main.async {
            self.present(vc, animated: true)
        }
    }
}

// MARK: - Private Function

extension NYTimesArticleDetailViewController{
    private func setupUI(with Object: PopularArticles?){
        
        self.view.backgroundColor = .black
        self.title = "Article Details"
        self.tableView.tableFooterView = UIView()
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        let backBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "backArrow"), style: .plain, target: self, action: #selector(goBack))
        self.navigationItem.leftBarButtonItems = [ backBarButton ]
        self.navigationItem.leftItemsSupplementBackButton = false
        self.view.backgroundColor = .black
        guard let validatedObject = Object else {
            self.btnReadFullArticleOutlet.isHidden = true
            self.lblPlaceHolder?.text = articleError
            self.tableView.isHidden = true
            return
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        // checking if object has url otherwise no need to show share button
        guard let shareURL = validatedObject.url else {return}
        if shareURL.isEmpty == false{
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareBtnClicked(btn:)))
        }
    }
}

// MARK: - TableView Delegates and DataSource
extension NYTimesArticleDetailViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.currentArticleObject != nil else {
            return 0}
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NYTimesArticleDetailViewController.cellIdentifier, for: indexPath) as? ArticleDetailCustomTableViewCell else {return ArticleDetailCustomTableViewCell()}
        guard let validatedObject = self.currentArticleObject else {return ArticleDetailCustomTableViewCell()}
        cell.setupCellUI(with: validatedObject)
        return cell
    }
}

// MARK: - Protocol Methods

extension NYTimesArticleDetailViewController : ArticleDetailView{
    
}
