//
//  PhoneBookViewController.swift
//  Homework
//
//  Created by Александр on 02.07.2021.
//

import UIKit

class PhoneBookViewController: UIViewController {
    var data: [BookCellData] = [BookCellData(number: "+79666666666", author:                                       "Виталий Цаль", description: "Дота игра для даунов                               конечно, ну в смысле не для даунов,вернее нет,                                  дота как раз не для даунов. Даунам не получится                                 играть в доту,я имею в виду дота именно..ну...игра                              даунов..игра даун..-ов..не для...а именно игра                                  даунов,без для,без для", image: UIImage(named:                                  "papa.jpg") ?? UIImage(), placeOfWork: "Завод"),
                                BookCellData(number: "+79999999999", author: "Billie Harington", description: "Проиграл не из-за того, что хуевый аим, а из-за того, что даун, в первую очередь. Ну аим тут не причем, но причем. Если б ты не был дауном, ты бы выиграл этот файт", image: UIImage(named: "Billy.jpg") ?? UIImage(), placeOfWork: "Помойка"),
                                BookCellData(number: "+72289999999", author: "Тимур Хафизов", description: "Знаешь, каким вопросом я задался: вот как я попадаюсь с тобой каждую игру? Мне казалось, я давно тебя в блеклист засунул. Ну, просто такого говноеда, который каждую игру играет хуже среднего или хуже хужего, блять, хуже нижнего. Вот как я с тобой попадаюсь в одну игру?", image: UIImage(named: "Negritto.png") ?? UIImage(), placeOfWork: "Крысис")]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

}
extension PhoneBookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        79
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let bookViewController = storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as? ContactViewController else { return }
        
        bookViewController.delegate = self
        bookViewController.book = data[indexPath.row]
        
        present(bookViewController, animated: true)
        
        //navigationController?.pushViewController(bookViewController, animated: true)
    }
}
extension PhoneBookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        cell.setData(book: data[indexPath.row])
        return cell
    }
}
extension PhoneBookViewController: ContactViewControllerDelegate {
    func saveNewDataOfBook(_ book: BookCellData) {
        if let index = data.firstIndex(where: { book.author == $0.author && $0.number == book.number } ) {
            data[index] = book
        }
    }
}

struct BookCellData {
    let number: String
    let author: String
    var description: String
    var image: UIImage
    var placeOfWork: String
}
