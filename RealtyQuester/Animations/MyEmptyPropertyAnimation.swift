//
//  MyEmptyPropertyAnimation.swift
//  RealtyQuester
//
//  Created by ghada Mohammad on 19/06/1445 AH.
//

import Lottie
import SwiftUI
import Foundation

struct MyEmptyPropertyAnimation: UIViewRepresentable {
    let loopMode: LottieLoopMode

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: "MyPropertyAnimation")
        animationView.play()
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}
