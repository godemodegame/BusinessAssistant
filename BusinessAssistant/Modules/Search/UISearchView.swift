import UIKit

final class UISearchView: UIView {

    // MARK: Components

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        return tableView
    }()

    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        tableView.frame = bounds
    }
}
