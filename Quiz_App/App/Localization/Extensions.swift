import Foundation

extension String {
    var localized: String {
        if let _ = UserDefaults.standard.string(forKey: "app_language") {} else {
            // default language
            UserDefaults.standard.set("en", forKey: "app_language")
            UserDefaults.standard.synchronize()
        }

        let lang = UserDefaults.standard.string(forKey: "app_language")

        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)

        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

