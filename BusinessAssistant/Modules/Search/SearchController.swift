import UIKit

final class SearchController: UIViewController {

    // MARK: Components

    private let searchController = UISearchController(searchResultsController: nil)
    
    var viewModel: [SearchResponse] = []

    // MARK: Properties

    var presenter: SearchViewOutput?

    // MARK: Lifecycle

    override func loadView() {
        view = UISearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        view().tableView.delegate = self
        view().tableView.dataSource = self
    }

    // MARK: Private methods

    private func view() -> UISearchView {
        view as! UISearchView
    }
}

// MARK: - SearchViewInput

extension SearchController: SearchViewInput {
    func set(viewModel: [SearchResponse]) {
        DispatchQueue.main.async {
            self.viewModel = viewModel
            self.view().tableView.reloadData()
        }
    }
}

// MARK: - UISearchBarDelegate

extension SearchController: UISearchBarDelegate {
    func searchBar(_: UISearchBar, textDidChange searchText: String) {
        presenter?.search(searchText)
    }

    func searchBarCancelButtonClicked(_: UISearchBar) {

    }
}

// MARK: - UITableViewDataSource

extension SearchController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModel.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = viewModel[indexPath.row].name
        return cell
    }
}

// MARK: - UITableViewDataSource

extension SearchController: UITableViewDelegate {
    
}
