//
//  InternalMenuViewController.swift
//  Moments
//
//  Created by chenying on 2022/10/9.
//

import RxDataSources
import UIKit
import SnapKit
import RxSwift

class InternalMenuViewController: BaseViewController {

    private var viewModel: InternalMenuViewModelType!
    //Type of expression is ambiguous without more context
    //这里面用到了self，需要在init方法里面调用不然报错
//    private var viewModelss: InternalMenuViewModel = InternalMenuViewModel(router: AppRouter.shared, routingSourceProvider: {[weak self] in
//        return self
//    })

    lazy var tableView: UITableView = configure(UITableView(frame: CGRect.zero, style: .grouped)) {
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 44
        $0.register(InternalMenuDescriptionCell.self, forCellReuseIdentifier: InternalMenuItemType.description.rawValue)
        $0.register(InternalMenuActionTriggerCell.self, forCellReuseIdentifier: InternalMenuItemType.actionTrigger.rawValue)
        $0.register(InternalMenuFeatureToggleCell.self, forCellReuseIdentifier: InternalMenuItemType.featureToggle.rawValue)
    }

    init(router: AppRouting = AppRouter.shared) {
        super.init()
        //super.init()//Must call a designated initializer of the superclass 'UIViewController'
        //需要用UIViewController的初始化方法(nib bundle)
        viewModel = InternalMenuViewModel(router: router, routingSourceProvider: { [weak self] in
            return self
        })
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        DispatchQueue.main.async {
            // Walkaround for a warning
            // https://github.com/RxSwiftCommunity/RxDataSources/issues/331
            self.setupBindings()
        }
    }
}

extension InternalMenuViewController {
    func setupUI() {
        title = viewModel.title
        view.addSubview(self.tableView)
    }
    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    func setupBindings() {
        let dismissBarButtonItem: UIBarButtonItem = UIBarButtonItem(systemItem: .done)
        dismissBarButtonItem.rx.tap.subscribe(onNext: { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
        navigationItem.rightBarButtonItem = dismissBarButtonItem

        let dataSource = RxTableViewSectionedReloadDataSource<InternalMenuSection>(configureCell: {_, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
            if let cell = cell as? InternalMenuCellType {
                cell.update(with: item)
            }
            return cell
        }, titleForHeaderInSection: { dataSource, section in
            return dataSource.sectionModels[section].title
        }, titleForFooterInSection: {  dataSource, section in
            return dataSource.sectionModels[section].footer
        })
        viewModel.setions
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        tableView.rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
        tableView.rx
            .modelSelected(InternalMenuItemViewModel.self)
            .subscribe(onNext: { item in
                item.select()
            })
            .disposed(by: disposeBag)
    }
}
