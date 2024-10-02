import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Text "mo:base/Text";

actor {
  // Define a type for translation records
  type TranslationRecord = {
    original: Text;
    translated: Text;
    targetLanguage: Text;
  };

  // Store translation history
  stable var translationHistory : [TranslationRecord] = [];

  // Add a translation to the history
  public func addTranslation(original: Text, translated: Text, targetLanguage: Text) : async () {
    let newRecord : TranslationRecord = {
      original = original;
      translated = translated;
      targetLanguage = targetLanguage;
    };
    translationHistory := Array.append(translationHistory, [newRecord]);
  };

  // Get the translation history
  public query func getTranslationHistory() : async [TranslationRecord] {
    translationHistory
  };

  // Clear the translation history
  public func clearHistory() : async () {
    translationHistory := [];
  };
}
