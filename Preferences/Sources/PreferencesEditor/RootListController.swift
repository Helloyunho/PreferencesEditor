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
                setValue(specifiers, forKey: "_specifiers")
                return specifiers
            }
        }
        set {
            super.specifiers = newValue
        }
    }
    let switchView = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.switchView.addTarget(self, action: #selector(self.toggleEnabled), for: .touchUpInside)
        let switchItem = UIBarButtonItem(customView: self.switchView)
        self.navigationItem.rightBarButtonItem = switchItem
        
        setEnabledState()
    }
    
    func setEnabledState() {
        let preferences: [String: Any] = UserDefaults.standard.persistentDomain(forName: "xyz.helloyunho.preferences-editor") ?? [:]
        let enabled = (preferences["enabled"] as? Bool) ?? false
        
        self.switchView.setOn(enabled, animated: true)
    }
    
    @objc func toggleEnabled() {
        var preferences: [String: Any] = UserDefaults.standard.persistentDomain(forName: "xyz.helloyunho.preferences-editor") ?? [:]
        let enabled = !((preferences["enabled"] as? Bool) ?? false)

        preferences["enabled"] = enabled
        UserDefaults.standard.setPersistentDomain(preferences, forName: "xyz.helloyunho.preferences-editor")
        setEnabledState()
        
        let alert = UIAlertController(title: "PreferenceEditor", message: "Quit(kill) Settings and reopen to \(enabled ? "enable" : "disable") the tweak!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
