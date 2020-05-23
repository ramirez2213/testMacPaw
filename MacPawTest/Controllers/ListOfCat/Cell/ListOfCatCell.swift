//
//  ListOfCatCell.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol ListCellViewModel {
    var title: String { get }
    var subtitle: String { get }

}

class ListOfCatCell: UITableViewCell {
    
    static let reuseId = "ListOfCatCell"
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(viewModel: ListCellViewModel) {
        title.text = viewModel.title
//        subtitle.text = viewModel.subtitle
    }
    
}
