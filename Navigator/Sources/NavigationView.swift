//
//  NavigationView.swift
//  Navigator
//
//  Created by Kyle Van Essen on 7/5/20.
//

import Foundation


final class NavigationView : UIView {
    
    let edgePan : UIScreenEdgePanGestureRecognizer
    
    let scrollView : UIScrollView
    let headerView : HeaderView
    
    func perform(_ action : Action)
    {
        
    }
    
    @objc private func edgePanStateChanged()
    {
        
    }
}


extension NavigationView {
    
    enum Action {
        case edgePanStarted(UIScreenEdgePanGestureRecognizer)
        case edgePanChanged(UIScreenEdgePanGestureRecognizer)
        case edgePanEnded(UIScreenEdgePanGestureRecognizer)
        
        case transition(Transition)
        
        struct Transition {
            var animated : Bool
            var direction : NavigationDirection
        }
    }
    
    struct State {
        var transitionState : TransitionState
        
        enum TransitionState {
            case none(ViewControllerState)
            case back(Back)
            case forward(Forward)
            
            struct Back {
                var animator : UIViewPropertyAnimator
                var to : ViewControllerState
                var from : ViewControllerState
            }
            
            struct Forward {
                var animator : UIViewPropertyAnimator
                var from : ViewControllerState
                var to : ViewControllerState
            }
            
            mutating func perform(_ action : Action)
            {
                
            }
        }
    }
}
