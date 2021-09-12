import Orion
import PreferencesEditorC
import Preferences

class PSGAboutDataSourceHook: ClassHook<NSObject> {
    static let targetName = "PSGAboutDataSource"
    private var preferences: [String: Any] {
        UserDefaults.standard.persistentDomain(forName: "xyz.helloyunho.preferences-editor-preferences") ?? [:]
    }
    private var tweakEnabled: Bool {
        (preferences["Enabled"] as? Bool) ?? true
    }
    
    @objc func value(forSpecifier specifier: Any) -> Any {
        if tweakEnabled, let specifier = specifier as? PSSpecifier {
            switch specifier.identifier {
            case "ProductVersion":
                if let productVersion = preferences["ProductVersion"] {
                    return productVersion
                }
                break
            default: break
            }
        }
        
        return orig.value(forSpecifier: specifier)
    }
    
    @objc func deviceName(_ arg1: Any) -> Any {
        if tweakEnabled, let deviceName = preferences["DeviceName"] {
            return deviceName
        } else {
            return orig.deviceName(arg1)
        }
    }
}
