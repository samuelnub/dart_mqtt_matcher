library mqtt_matcher;

class MqttMatcher {
  static const String SEPARATOR = r'/';
  static const String WILDCARD_SINGLE = r'+';
  static const String WILDCARD_MULTI = r'#';
  static const String INTERNAL_STATS = r'$';

  /// Determines if a given topic string matches with a broader topic pattern.
  /// For example, you would want the topic of 'home/livingroom/lights' to match with the pattern 'home/+/lights'
  static bool isTopicMatch(String topicPattern, String topic) {
    // post this to r/badcode

    final topicPatternSplit = topicPattern.split(SEPARATOR);
    final topicSplit = topic.split(SEPARATOR);

    if((topicPatternSplit.length != topicSplit.length && topicPatternSplit.last != WILDCARD_MULTI) || topicSplit.length < topicPatternSplit.length) {
      return false;
    }

    int matchCount = 0;
    for(int i = 0; i < topicSplit.length; i++) {
      if(i >= topicPatternSplit.length) {
        break;
      }
      if(topicPatternSplit[i] == topicSplit[i] || topicPatternSplit[i] == WILDCARD_SINGLE) {
        matchCount++;
      }
    }
    if(topicPatternSplit.last == WILDCARD_MULTI && matchCount >= topicPatternSplit.length-1) {
      matchCount++;
    }
    return (matchCount >= topicPatternSplit.length) ? true : false;
  }
}