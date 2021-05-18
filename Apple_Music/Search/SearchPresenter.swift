//
//  SearchPresenter.swift
//  Apple_Music
//
//  Created by Антон on 13.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  func presentData(response: Search.Model.Response.ResponseType) {
    switch response {
    case .presentTracks(let searchResult):
       let cells = searchResult?.results.map({ (track)  in
            performCell(from: track)
        }) ?? []
        let searchViewModel = SearchViewModel.init(cells: cells)
        viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks(searchViewModel: searchViewModel))
    case .presentFooterView:
        viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayFooterView)
    }
  }
    
    private func performCell(from track: Track) -> SearchViewModel.Cell{
        
        return SearchViewModel.Cell.init(iconUrlString: track.artworkUrl100, collectionName: track.collectionName ?? "", trackName: track.trackName, artistName: track.artistName,previewUrl: track.previewUrl)
    }
  
}
