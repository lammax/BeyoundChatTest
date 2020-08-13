//
//  SpeechManager.swift
//  BeyondChat
//
//  Created by Mac on 12.08.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import AVFoundation

enum LangVoice: String {
    case American = "en-US"
    case Irish = "en-IE"
    case Australian = "en-AU"
}

class SpeechManager: NSObject {
    
    static let sharedInstance = SpeechManager()
    
    private let synthesizer = AVSpeechSynthesizer()
    private var langVoice: LangVoice = .American
    
    private var speechCompletion: (() -> Void)?
    
    override init() {
        super.init()
        synthesizer.delegate = self
    }
    
    func set(voice: LangVoice) {
        self.langVoice = voice
    }
    
    func say(this text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: self.langVoice.rawValue)
        
        //print(AVSpeechUtteranceMinimumSpeechRate)
        //print(AVSpeechUtteranceMaximumSpeechRate)
        
        synthesizer.speak(utterance)
    }
    
    func set(speech completion: (() -> Void)?) {
        self.speechCompletion = completion
    }
    
}

extension SpeechManager: AVSpeechSynthesizerDelegate {
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.speechCompletion?()
    }
    
}
