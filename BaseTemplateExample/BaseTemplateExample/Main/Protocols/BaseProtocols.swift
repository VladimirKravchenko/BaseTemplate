//
// Created by Vladimir Kravchenko on 3/2/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

//MARK: Base protocols

internal protocol BasePresenter: class {
  associatedtype InteractorType
  associatedtype RouterType
  associatedtype ViewType

  var interactor: InteractorType! {get set}
  var router: RouterType! {get set}
  var view: ViewType! {get set} //should be weak
}

internal protocol BaseView: class {
  associatedtype EventHandlerType
  var eventHandler: EventHandlerType! {get set}
}

internal protocol BaseInteractor: class {
  associatedtype PresenterType
  var presenter: PresenterType! {get set} //should be weak
}

internal protocol BaseRouter: class {
  weak var delegate: AnyObject! {get set}
  weak var viewController: UIViewController! {get set}
}

internal protocol BaseModule: class {
  associatedtype ConfiguratorType
  var viewController: UIViewController {get}
  init(withViewController viewController: UIViewController, configurator: ConfiguratorType)
}

//MARK: Generic function for module creation

internal func moduleWithType<Module: BaseModule, Presenter: BasePresenter, View: BaseView,
  Interactor: BaseInteractor, Router: BaseRouter>
  (_ ModuleType: Module.Type, presenter: Presenter, view: View,
  interactor: Interactor, router: Router) throws -> Module {
    guard let configurator = presenter as? Module.ConfiguratorType else {
      throw ModuleCreationError.presenterNotConformConfiguratorProtocol
    }
    guard presenter is View.EventHandlerType else {
      throw ModuleCreationError.presenterNotConformEventHandlerProtocol
    }
    guard presenter is Interactor.PresenterType else {
      throw ModuleCreationError.presenterNotConformPresentingProtocol
    }
    guard let viewController = view as? UIViewController else {
      throw ModuleCreationError.viewIsNotViewController
    }
    guard view is Presenter.ViewType else {
      throw ModuleCreationError.viewNotConformViewProtocol
    }
    guard interactor is Presenter.InteractorType else {
      throw ModuleCreationError.interactorNotConformInteractingProtocol
    }
    guard router is Presenter.RouterType else {
      throw ModuleCreationError.routerNotConformRoutingProtocol
    }
    view.eventHandler = presenter as? View.EventHandlerType
    presenter.view = view as? Presenter.ViewType
    presenter.router = router as? Presenter.RouterType
    presenter.interactor = interactor as? Presenter.InteractorType
    interactor.presenter = presenter as? Interactor.PresenterType
    router.viewController = viewController
    router.delegate = presenter
    return ModuleType.init(withViewController: viewController, configurator: configurator)
}

internal enum ModuleCreationError: Error {
  case presenterNotConformConfiguratorProtocol
  case presenterNotConformEventHandlerProtocol
  case presenterNotConformPresentingProtocol
  case viewIsNotViewController
  case viewNotConformViewProtocol
  case interactorNotConformInteractingProtocol
  case routerNotConformRoutingProtocol
}
