//
//  ListOfCatPresenter.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol ListOfCatPresentationLogic {
    func presentData(response: ListOfCat.Model.Response.ResponseType)
}

class ListOfCatPresenter: ListOfCatPresentationLogic {
    weak var viewController: ListOfCatDisplayLogic?
    
    func presentData(response: ListOfCat.Model.Response.ResponseType) {
        
        switch response {
        case .presentList(let feed):
            
            let cells = feed.map { (feedItem) in
                cellViewModel(from: feedItem)
            }
            
            let listViewModel = ListViewModel.init(cells: cells)
            
            viewController?.displayData(viewModel: ListOfCat.Model.ViewModel.ViewModelData.displayListOfCat(feedViewModel: listViewModel))
        }
    }
    
    private func cellViewModel(from feedItem: FeedResponse) -> ListViewModel.Cell {
        return ListViewModel.Cell.init(title: feedItem.name!,
                                       subtitle: feedItem.description!
        )
    }
}
