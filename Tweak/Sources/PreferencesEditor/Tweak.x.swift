import Orion
import PreferencesEditorC
import Preferences

class PSGAboutControllerHook: ClassHook<PSListController> {
    static let targetName = "PSGAboutController"
    
    func viewDidLoad() {
        orig.viewDidLoad()
        if let specifier = target.specifier(forID: "ProductVersion") {
            Ivars<Selector>(specifier).getter = #selector(self.value)
        }
    }

    // orion: new
    @objc open func value(specifier: PSSpecifier) -> String {
        "15.0"
    }
}
