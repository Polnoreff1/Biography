//
//  NewsTableViewCell.swift
//  Biography
//
//  Created by Андрей  on 30.10.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell, CellIdentifiable  {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with model: Result) -> NewsTableViewCell {
        cellTitle.text = model.title ?? ""
        cellSubtitle.text = model.source ?? ""
        return self
    }
    
    
}
