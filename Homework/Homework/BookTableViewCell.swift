//
//  BookTableViewCell.swift
//  Homework
//
//  Created by Александр on 03.07.2021.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(book: BookCellData) {
        numberLabel.text = book.number
        authorLabel.text = book.author
    }

}
