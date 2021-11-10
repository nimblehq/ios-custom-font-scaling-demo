//
//  Navigator+Scene.swift
//

import UIKit

extension Navigator {

    enum Scene {

        case selectOS(viewModel: SelectOSViewModelProtocol)
        case iOS10
        case iOS11Tabbar
    }
}
