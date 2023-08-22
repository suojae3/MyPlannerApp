//
//  ViewController.swift
//  MyPlanner
//
//  Created by ㅣ on 2023/08/22.
//

import UIKit

class MonthlyView: UIViewController {

    var viewModel = MonthlyViewModel()
    private let uiModule = UIModule()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel = MonthlyViewModel()
        addView()
        setupConstraints()

    }
    
    func addView() {
        view.addSubview(uiModule.profileView)
        view.addSubview(uiModule.searchBar)
        view.addSubview(uiModule.calendarView)
        view.addSubview(uiModule.tasksTableView)
        view.addSubview(uiModule.floatingButton)
        uiModule.floatingButton.addTarget(self, action: #selector(handleAddTask), for: .touchUpInside)

    }
    
    @objc func handleAddTask() {
        print("플로팅버튼 테스트")
    }
    
    func setupConstraints() {
        
        // AutoResizeMask 끄기
        uiModule.profileView.translatesAutoresizingMaskIntoConstraints = false
        uiModule.searchBar.translatesAutoresizingMaskIntoConstraints = false
        uiModule.calendarView.translatesAutoresizingMaskIntoConstraints = false
        uiModule.tasksTableView.translatesAutoresizingMaskIntoConstraints = false
        uiModule.floatingButton.translatesAutoresizingMaskIntoConstraints = false
            
        // Profile View 제약
        NSLayoutConstraint.activate([
            uiModule.profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            uiModule.profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiModule.profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiModule.profileView.heightAnchor.constraint(equalToConstant: 100)
        ])
            
        // SearchBar 제약
        NSLayoutConstraint.activate([
            uiModule.searchBar.topAnchor.constraint(equalTo: uiModule.profileView.bottomAnchor, constant: 10),
            uiModule.searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            uiModule.searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
            
        // Calendar View 제약
        NSLayoutConstraint.activate([
            uiModule.calendarView.topAnchor.constraint(equalTo: uiModule.searchBar.bottomAnchor, constant: 10),
            uiModule.calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiModule.calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiModule.calendarView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        // Tasks TableView 제약
        NSLayoutConstraint.activate([
            uiModule.tasksTableView.topAnchor.constraint(equalTo: uiModule.calendarView.bottomAnchor, constant: 10),
            uiModule.tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiModule.tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiModule.tasksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
            
        // Floating Button 제약
        NSLayoutConstraint.activate([
            uiModule.floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            uiModule.floatingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            uiModule.floatingButton.widthAnchor.constraint(equalToConstant: 50),
            uiModule.floatingButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
}




class UIModule {
    let profileView: UIView = {
           let view = UIView()
           view.backgroundColor = .lightGray
           return view
       }()
       
       let searchBar: UISearchBar = {
           let searchBar = UISearchBar()
           return searchBar
       }()
       
       let calendarView: UIView = {
           let view = UIView()
           view.backgroundColor = .black
           return view
       }()
    
    let tasksTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let floatingButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.layer.cornerRadius = 25
        return button
    }()
    
    @objc func handleAddTask() {
        print("플로팅버튼 테스트")
    }

}
