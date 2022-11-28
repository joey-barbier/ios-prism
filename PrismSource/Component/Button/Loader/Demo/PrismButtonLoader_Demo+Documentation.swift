//
//  PrismButtonLoader_Demo+Documentation.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 20/11/2022.
//

import Foundation

extension Prism.Button.Loader.Demo {
    struct Documentation {
        var model: Model
        
        func getValue() -> String {
            return
"""
Implementation :

<pre><code class="language-swift">
Prism.Button.Loader(action: { /* ... */ },
                   isLoading: $isLoading,
                   style: Prism.Button.Loader.Style(width: 250,
                                                    height: 55,
                                                    cornerRadius: 8,
                                                    backgroundColor: Color.black,
                                                    loadingColor: Color.white,
                                                    strokeWidth: 5,
                                                    strokeColor: Color.white),
                   builder: {
   Text("Télécharger")
       .foregroundColor(Color.white)
})
</code></pre>
"""
        }
    }
}
