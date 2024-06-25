//
//  HomeViewController.swift
//  WhereToGo_Honam
//
//  Created by 권정근 on 6/25/24.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - UI Components
    private let attractionTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return tableView
    }()
    
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(attractionTableView)
        
        attractionTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        
        setupTableViewDelegate()
        setupNavigationItems()
        setupNavigationTitle()
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

        navigationItem.rightBarButtonItem = notificationItem
    }
    
    private func setupNavigationTitle() {
        navigationItem.title = "장소"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    @objc private func didTapNotification() {
        
    }
    
//    @objc private func didTapSignout() { }
}



// MARK: - Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
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
        return 40
    }
}
