//
//  ViewController.swift
//  Pokemon
//
//  Created by Maxim on 10.03.2023.
//

import UIKit

class PokemomListViewController: UIViewController {

    let foo = ["one", "two", "three", "four", "five"]

    var tableView = UITableView()

    struct Cells {
        static let pokemonCell = "PokemonCell"
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokemons"
        configureTableView()

    }
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: Cells.pokemonCell)
        tableView.pin(to: view)

    }
    private func setTableViewDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension PokemomListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        foo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.pokemonCell) as? PokemonTableViewCell else { return UITableViewCell }






        return cell
    }


}
