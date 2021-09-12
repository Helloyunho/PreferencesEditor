import Preferences
import PreferencesEditorC
import UIKit

class RootListController: PSListController {
    override var specifiers: NSMutableArray? {
        get {
            if let specifiers = value(forKey: "_specifiers") as? NSMutableArray {
                return specifiers
            } else {
                let specifiers = loadSpecifiers(fromPlistName: "Root", target: self)
                for specifier in specifiers! {
                    if let specifier = specifier as? PSTextFieldSpecifier {
                        switch specifier.identifier {
                        case "DeviceName":
                            specifier.setPlaceholder(UIDevice.current.name)
                        case "ProductVersion":
                            specifier.setPlaceholder(UIDevice.current.systemVersion)
                        default: break
                        }
                    }
                }
                setValue(specifiers, forKey: "_specifiers")
                return specifiers
            }
        }
        set {
            super.specifiers = newValue
        }
    }

    let switchView = UISwitch()
    var preferences: [String: Any] {
        get {
            UserDefaults.standard.persistentDomain(forName: "xyz.helloyunho.preferences-editor-preferences") ?? [:]
        }
        set(updatedPrefs) {
            UserDefaults.standard.setPersistentDomain(updatedPrefs, forName: "xyz.helloyunho.preferences-editor-preferences")
        }
    }
    var tweakEnabled: Bool {
        get {
            (preferences["Enabled"] as? Bool) ?? true
        }
        set(enable) {
            preferences["Enabled"] = enable
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.switchView.addTarget(self, action: #selector(self.toggleEnabled), for: .touchUpInside)
        let switchItem = UIBarButtonItem(customView: self.switchView)
        self.navigationItem.rightBarButtonItem = switchItem

        self.setEnabledState()
    }

    func setEnabledState() {
        self.switchView.setOn(tweakEnabled, animated: true)
    }

    @objc func toggleEnabled() {
        tweakEnabled = !tweakEnabled
        self.setEnabledState()

//        let alert = UIAlertController(title: "PreferenceEditor", message: "Quit(kill) Settings and reopen to \(tweakEnabled ? "enable" : "disable") the tweak!", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
    }
}
