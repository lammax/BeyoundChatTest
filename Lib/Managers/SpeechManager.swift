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

class SpeechManager {
    
    static let sharedInstance = SpeechManager()
    
    private let synthesizer = AVSpeechSynthesizer()
    private var langVoice: LangVoice = .American
    
    func set(voice: LangVoice) {
        self.langVoice = voice
    }
    
    func say(this text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: self.langVoice.rawValue)
        
        print(AVSpeechUtteranceMinimumSpeechRate)
        print(AVSpeechUtteranceMaximumSpeechRate)
        
        synthesizer.speak(utterance)
    }
    
}
