//
//  SearchViewController.swift
//  Apple_Music
//
//  Created by Антон on 13.02.2021.
//

import UIKit
import Alamofire

struct TrackModel {
    var trackName: String
    var artistName: String
}

class SearchMusicViewController: UITableViewController, UISearchControllerDelegate{
    
    var networkService = NetworkService()
    
    var timer: Timer?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var tracks = [Track]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupTableView()
        view.backgroundColor = .white
    }
    
    private func setupSearchController(){
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let trackModel = tracks[indexPath.row]
        
        cell.textLabel?.text = "\(trackModel.artistName)\n\(trackModel.trackName)"
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.font = UIFont(name: "", size: 30)
        cell.imageView?.image = #imageLiteral(resourceName: "Image")
        
        
        return cell
    }
}

extension SearchMusicViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkService.fetchTracks(searchText: searchText) { [weak self](objects) in
                self?.tracks = objects?.results ?? []
                self?.tableView.reloadData()
            }
        })
        
    }
}


