//
//  MainTabBarController.swift
//  Apple_Music
//
//  Created by Антон on 13.02.2021.
//

import UIKit

protocol TabBarDelegate: class {
    func minimizedTrackDetailController()
    func maximizedTrackDetailController(cellViewModel: SearchViewModel.Cell?)
}

class MainTabBarController: UITabBarController{
    
    
    private var minimumTopAnchor: NSLayoutConstraint!
    private var maximumTopAnchor: NSLayoutConstraint!
    private var bottomAnchor: NSLayoutConstraint!
    
    
    let searchVC: SearchViewController = SearchViewController.loadFromStoryboard()
    
    let trackDetailView: TrackDetailView = TrackDetailView.loadFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        setupTrackDetailView()
        searchVC.tabBarDelegate = self

        viewControllers = [
            generateViewController(rootViewController: searchVC, image: #imageLiteral(resourceName: "search-1"), title: "Search"),
            generateViewController(rootViewController: ViewController(), image: #imageLiteral(resourceName: "library"), title: "Library")
        ]
        
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage?, title: String) -> UIViewController{
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
    
    private func setupTrackDetailView(){
        trackDetailView.translatesAutoresizingMaskIntoConstraints = false
        trackDetailView.tabBarDelegate = self
        trackDetailView.delegate = searchVC
        view.insertSubview(trackDetailView, belowSubview: tabBar)
      
        //autoLayoutConstraint
        
      
        
        maximumTopAnchor = trackDetailView.topAnchor.constraint(equalTo: view.topAnchor,constant: view.frame.height)
        minimumTopAnchor = trackDetailView.topAnchor.constraint(equalTo: tabBar.topAnchor,constant: -50)
        bottomAnchor = trackDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height)
        maximumTopAnchor.isActive = true
        bottomAnchor.isActive = true
        
        trackDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trackDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

//MARK: -TabBarDelegate

extension MainTabBarController: TabBarDelegate{
    func maximizedTrackDetailController(cellViewModel: SearchViewModel.Cell?) {
        maximumTopAnchor.isActive = true
        minimumTopAnchor.isActive = false
        maximumTopAnchor.constant = 0
        bottomAnchor.constant = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.tabBar.alpha = 0
        }, completion: nil)
        
        guard let viewModel = cellViewModel else {return}
        
        trackDetailView.set(viewModel: viewModel)
    }
    

    
    func minimizedTrackDetailController() {
        maximumTopAnchor.isActive = false
        bottomAnchor.constant = view.frame.height
        minimumTopAnchor.isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.tabBar.alpha = 1
        }, completion: nil)
    }
    
    
}
