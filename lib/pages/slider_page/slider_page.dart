import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/slider_page/slider_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

class SliderPage extends StatelessWidget {
  static String routeName = 'Slider';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        child: ViewModelProvider<SliderViewModel>.withConsumer(
            viewModel: SliderViewModel(),
            builder: (context, model, child) {
              double value1 = model.sliderValue;
              return Column(children: <Widget>[
                SizedBox(height: 50),
                Slider(
                    value: value1,
                    onChanged: model.setSliderValue,
                    label: "value -> $value1",
                    divisions: 10),
                Slider(
                    value: value1,
                    onChanged: model.setSliderValue,
                    activeColor: Colors.orange,
                    inactiveColor: Colors.pink),
                Text('Custom Slider'),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: 10,
                      thumbColor: Colors.black87,
                      activeTickMarkColor: Colors.red,
                      inactiveTickMarkColor: Colors.lime,
                      valueIndicatorColor: Colors.grey),
                  child: Slider(
                      value: value1,
                      onChanged: model.setSliderValue,
                      label: "value -> $value1",
                      divisions: 10),
                ),
                SizedBox(
                  height: 30,
                ),
                RangeSlider(
                  values: model.rangeValues,
                  onChanged: model.setRangeValues,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  labels: RangeLabels(
                      model.rangeValues.start.toStringAsFixed(0), model.rangeValues.end.toString()),
                )
              ]);
            }),
      ),
    );
  }
}
