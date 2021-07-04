//
//  ContactViewController.swift
//  Homework
//
//  Created by Александр on 03.07.2021.
//

import UIKit

protocol ContactViewControllerDelegate: AnyObject {
    func saveNewDataOfBook(_ book: BookCellData)
    
}
class ContactViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var textView: UITextView!
    var book: BookCellData?
    weak var delegate: ContactViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = book?.image
        textView.text = book?.description
        label1.text = book?.author
        label2.text = book?.number
        label3.text = book?.placeOfWork

        // Do any additional setup after loading the view.
    }
    @IBAction func saveButton(_ sender: Any) {
        book?.description = textView.text
        if let book = book {
            delegate?.saveNewDataOfBook(book)
        }
        // navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
