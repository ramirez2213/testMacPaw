//
//  ListOfCatViewController.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol ListOfCatDisplayLogic: class {
    func displayData(viewModel: ListOfCat.Model.ViewModel.ViewModelData)
}

class ListOfCatViewController: UIViewController, ListOfCatDisplayLogic {
    
    var interactor: ListOfCatBusinessLogic?
    var router: (NSObjectProtocol & ListOfCatRoutingLogic)?
    
    private var listViewModel = ListViewModel.init(cells: [])
    
    @IBOutlet weak var table: UITableView!
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = ListOfCatInteractor()
        let presenter             = ListOfCatPresenter()
        let router                = ListOfCatRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        interactor?.makeRequest(request: ListOfCat.Model.Request.RequestType.getList)
    }
    
    //MARK: - setup Table View
    
    private func setupTableView() {
        self.table.register(UINib(nibName: "ListOfCatCell", bundle: nil), forCellReuseIdentifier: ListOfCatCell.reuseId)
    }
    
    
    func displayData(viewModel: ListOfCat.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayListOfCat(feedViewModel: let feedViewModel):
            self.listViewModel = feedViewModel
            table.reloadData()
        }
    }
    
}

extension ListOfCatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOfCatCell.reuseId, for: indexPath) as! ListOfCatCell
        let cellListViewModel = listViewModel.cells[indexPath.row]
        cell.set(viewModel: cellListViewModel)
        return cell
    }
    
    
}

extension ListOfCatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select row")
        interactor?.makeRequest(request: .getList)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
