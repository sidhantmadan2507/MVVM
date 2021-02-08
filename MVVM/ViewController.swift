//
//  ViewController.swift
//  MVVM
//
//  Created by Sidhant Madan on 08/02/21.
//

import UIKit

struct Person {
    let firstName: String
    let lastName: String
    let gender: String
    let age: Int
    let height: Double
}

struct cellViewModel {
    let firstName: String
    let lastName: String
}

class ViewController: UIViewController {

    //
    @IBOutlet weak var tableView: UITableView!
    var data = [
        Person(firstName: "A", lastName: "XYZ", gender: "Male", age: 25, height: 150),
        Person(firstName: "B", lastName: "XYZ", gender: "Male", age: 25, height: 150),
        Person(firstName: "C", lastName: "XYZ", gender: "Male", age: 25, height: 150)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as!
            CustomTableViewCell
        let model = data[indexPath.row]
        cell.configure(with: cellViewModel(firstName: model.firstName, lastName: model.lastName))
        return cell
    }
}


