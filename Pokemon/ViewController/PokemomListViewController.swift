//
//  ViewController.swift
//  Pokemon
//
//  Created by Maxim on 10.03.2023.
//

import UIKit

class PokemomListViewController: UIViewController {

    let foo = ["one", "two", "three", "four", "five"]
    var pokemons: [Pokemon] = []

    var tableView = UITableView()

    struct Cells {
        static let pokemonCell = "PokemonCell"
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokemons"
        fetchPokemons()
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

    private func fetchPokemons() {
        NetworkManager.shared.fetchData { [weak self ]result in
            switch result {
            case .success(let pokemons):
                self?.pokemons = pokemons
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

extension PokemomListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.pokemonCell, for: indexPath) as? PokemonTableViewCell else { return UITableViewCell() }
        let pokemon = pokemons[indexPath.row]
        cell.configure(with: pokemon)
        return cell
    }
}
