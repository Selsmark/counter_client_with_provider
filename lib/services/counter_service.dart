import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_client_with_provider/models/counter_model.dart';

// Gets the current value with 'Get',
// increments by 1 and gets value with 'Increment',
// decrements by 1 and gets value with 'Decrement'
Future<CounterModel?> _getAsync(String endpoint) async {
  final url = Uri.parse('http://192.168.196.199:5112/Counter/$endpoint');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // Decode the JSON response into a CounterModel object
    final parsedData = jsonDecode(response.body);
    final counter = CounterModel(
      counter: parsedData,
    );

    return counter;
  } else {
    print('Error fetching data: ${response.statusCode}');
    return null;
  }
}

Future<CounterModel?> getCounterAsync() async {
  return await _getAsync('Get');
}

// Increments the counter by 1 and gets the new value
Future<CounterModel?> incrementCounterAsync() async {
  return await _getAsync('Increment');
}

// Decrements the counter by 1 and gets the new value
Future<CounterModel?> decrementCounterAsync() async {
  return await _getAsync('Decrement');
}
