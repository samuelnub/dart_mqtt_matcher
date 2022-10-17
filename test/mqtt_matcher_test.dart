import 'package:flutter_test/flutter_test.dart';

import 'package:mqtt_matcher/mqtt_matcher.dart';

void main() {
  test('MQTT Topic Pattern matching', () {
    expect(MqttMatcher.isTopicMatch('test', 'test'), true);
    expect(MqttMatcher.isTopicMatch('test/#', 'test/hello/there'), true);
    expect(MqttMatcher.isTopicMatch('test/#', 'test'), false);
    expect(MqttMatcher.isTopicMatch('test/+/unga', 'test/ooga/unga'), true);
    expect(MqttMatcher.isTopicMatch('test/ooga/+/booga/#', 'test/ooga/aeugh/booga/unga'), true);
    expect(MqttMatcher.isTopicMatch('#', 'test'), true);
    expect(MqttMatcher.isTopicMatch('#/test', 'hi/test'), false);
    expect(MqttMatcher.isTopicMatch('test/#', 'test'), false);
    expect(MqttMatcher.isTopicMatch('test2', 'test'), false);
    expect(MqttMatcher.isTopicMatch(r'$SYS/#', r'$SYS/clients'), true);
  });
}
