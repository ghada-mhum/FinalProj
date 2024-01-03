//
//  ChatAnimation.swift
//  RealtyQuester
//
//  Created by ghada Mohammad on 18/06/1445 AH.
//


import Lottie
import SwiftUI
import Foundation

struct ChatAnimation: UIViewRepresentable {
    let loopMode: LottieLoopMode

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: "ChatAnimation")
        animationView.play()
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}
