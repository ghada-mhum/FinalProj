//
//  ScanAnimation.swift
//  RealtyQuester
//
//  Created by ghada Mohammad on 20/06/1445 AH.
//

import Lottie
import SwiftUI
import Foundation

struct ScanAnimation: UIViewRepresentable {
    let loopMode: LottieLoopMode

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: "scanAnimation")
        animationView.play()
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}
