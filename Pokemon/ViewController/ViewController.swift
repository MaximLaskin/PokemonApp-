//
//  ViewController.swift
//  Pokemon
//
//  Created by Maxim on 10.03.2023.
//

import UIKit

class ViewController: UIViewController {

    let foo = ["one", "two", "three", "four", "five"]

    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView = UITableView(frame: self.view.bounds, style: .plain)
//        tableView.backgroundColor = UIColor.white
//
//        #warning("TODO - посмотреть что будет, если сделать true")
//        tableView.showsVerticalScrollIndicator = false
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        self.view.addSubview(tableView)

    }
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        

    }
    private func setTableViewDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        foo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)


        return cell
    }


}
