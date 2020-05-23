//
//  QuizPresenter.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 17.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol QuizPresentationLogic {
    func presentData(response: Quiz.Model.Response.ResponseType)
}

class QuizPresenter: QuizPresentationLogic {
    weak var viewController: QuizDisplayLogic?
    
    func presentData(response: Quiz.Model.Response.ResponseType) {
        
        switch response {
            
        case .presentList(feed: let feed):
            viewController?.displayData(viewModel: Quiz.Model.ViewModel.ViewModelData.detailDisplayListOfCat(feedViewModel: feed))
            
        case .presentListForQuiz(answ: let answ):
            
            guard answ.id != nil else {return}
            guard answ.message != nil else {return}
            
        case .presentBreedListName(feed: let feed):
            
            var array:[String] = []
            
            _ = feed.map { (response) in
                guard let name = response.name else {return}
                array.append(name)
            }
            
            let randomName = array.randomElement()!
            viewController?.displayData(viewModel: Quiz.Model.ViewModel.ViewModelData.displayBreedListName(name: randomName))
        }
    }
    
}
