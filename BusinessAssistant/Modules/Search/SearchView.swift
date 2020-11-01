import SwiftUI

struct SearchView: UIViewControllerRepresentable {
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<SearchView>
    ) -> UINavigationController {
        let viewController = SearchController()
        let presenter = SearchPresenter()

        viewController.presenter = presenter
        presenter.view = viewController

        return UINavigationController(rootViewController: viewController)
    }

    func updateUIViewController(
        _: UINavigationController,
        context: UIViewControllerRepresentableContext<SearchView>
    ) {

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
