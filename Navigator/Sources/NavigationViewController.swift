//
//  NavigationViewController.swift
//  Navigator
//
//  Created by Kyle Van Essen on 7/4/20.
//

import UIKit



public final class NavigationViewController : UIViewController {
    
    public var viewControllers : [NavigationContentViewController] {
        get { fatalError() }
        set { fatalError() }
    }
    
    public var emptyViewController : () -> NavigationContentViewController = {
        fatalError()
    }
    
    // MARK: Initialization
    
    public init(root viewController : NavigationContentViewController) {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }
    
    // MARK: UIViewController
    
    public override var shouldAutomaticallyForwardAppearanceMethods : Bool {
        false
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    public override func loadView() {
        fatalError()
    }
    
    public typealias Completion = (Bool) -> ()
    
    public func push(_ viewController : NavigationContentViewController, animated : Bool = false, completion : @escaping Completion = { _ in })
    {
        fatalError()
    }
    
    public func push(_ viewControllers : [NavigationContentViewController], animated : Bool = false, completion : @escaping Completion = { _ in })
    {
        fatalError()
    }
    
    public func pop(animated : Bool = false, completion : @escaping Completion = { _ in }) -> NavigationContentViewController
    {
        fatalError()
    }
    
    public func pop(to viewController : NavigationContentViewController, animated : Bool = false, completion : @escaping Completion = { _ in }) -> [NavigationContentViewController]
    {
        fatalError()
    }
    
    public func set(
        viewControllers : [NavigationContentViewController],
        focused : NavigationContentViewController,
        animated : Bool = false,
        completion callerCompletion : @escaping Completion = { _ in }
    ) {
        fatalError()
    }
}


public struct NavigationConfig
{
    public var header : Header
    
    public struct Header {
        public var isVisible : Bool
        
        public var backItem : BackItem?
        
        public var left : [ButtonItem]
        public var right : [ButtonItem]
    }
}

public struct BackItem {
    public var onTap : (() -> ())?
    public var isVisible : Bool
}

public struct ButtonItem {
    
    var icon : UIImage?
    var title : String?
    
    var onTap : () -> ()
    
    var style : Style
    
    enum Style {
        case primary
        case secondary
        case tertiary
    }
}


public protocol NavigationContentViewController : UIViewController
{
    var navConfig : NavigationConfig { get }
}


enum NavigationDirection {
    case forward
    case back
}


struct NavigationState {
    var viewControllers : [ViewControllerState]
    var focused : ViewControllerState
}


final class ViewControllerState : Hashable {
    
    let value : NavigationContentViewController
    
    var visibilityState : Visibility
    
    init(_ value : NavigationContentViewController) {
        self.value = value
        self.visibilityState = .notVisible
    }
    
    // MARK: Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.value.objectID)
    }
    
    // MARK: Hashable
    
    static func == (lhs: ViewControllerState, rhs: ViewControllerState) -> Bool {
        lhs.value === rhs.value
    }
    
    enum Visibility : Equatable {
        case notVisible
        case appearing
        case visible
        case disappearing
    }
}


private extension UIViewController {
    var objectID : ObjectIdentifier {
        ObjectIdentifier(self)
    }
}
