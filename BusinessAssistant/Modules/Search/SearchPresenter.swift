import Foundation

protocol SearchViewOutput: AnyObject {
    func search(_ searchString: String)
}

final class SearchPresenter: SearchViewOutput {
    weak var view: SearchViewInput?
    // MARK: SearchViewOutput

    func search(_ searchString: String) {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONDecoder().decode([SearchResponse].self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.view?.set(viewModel: jsonResult)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}


protocol SearchViewInput: AnyObject {
    func set(viewModel: [SearchResponse])
}
