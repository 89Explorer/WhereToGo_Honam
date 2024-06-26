//
//  HomeViewController.swift
//  WhereToGo_Honam
//
//  Created by 권정근 on 6/25/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    private let categories = ["Attractions", "Hotels", "Foods", "Shoppings", "Events"]
    
    private lazy var headerView = CatergoryMenuHeader(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50))
    

    // MARK: - UI Components
    private let attractionTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(attractionTableView)
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
         
        attractionTableView.tableHeaderView = headerView
        headerView.delegate = self
        
        setupTableViewDelegate()
        setupNavigationItems()
        setupNavigationTitle()
        setupSearchBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        attractionTableView.frame = view.bounds
        
    }
    
    
    
    // MARK: - Functions
    private func setupTableViewDelegate() {
        attractionTableView.delegate = self
        attractionTableView.dataSource = self
    }
    
    private func setupNavigationItems() {
        let notificationItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(didTapNotification))
        
        notificationItem.tintColor = .label
        
//        let signoutItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(didTapSignout))
        
        let savedItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(didTapSaved))
        savedItem.tintColor = .label

        navigationItem.rightBarButtonItems = [notificationItem]
    }
    
    private func setupNavigationTitle() {
        navigationItem.title = "Discover"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    /// setup searchBar
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Where to go?"
        self.navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc private func didTapNotification() {
        
    }
    
    @objc private func didTapSaved() {
        
    }
//    @objc private func didTapSignout() { }
    
    
}



// MARK: - Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    // section 안의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 10, y: header.bounds.origin.y , width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .label
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
}

extension HomeViewController: CategoryMenuViewDelegate {
    func categoryMenuView(_ categoryMenuView: CatergoryMenuHeader, didselectedItemAt index: Int) {
        print("Selected category: \(index)")
    }
}
