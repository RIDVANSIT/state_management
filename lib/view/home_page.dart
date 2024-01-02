import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/view_model/home_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("Sayfa baştan oluştu");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlutterLogo(
            size: 96,
          ),
          _buildTitle(context),
          _buildButton(context),
          _buildCheckboxRow(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    print("Title oluştu");

    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        print("Title - Consumer oluştu");
        return Text(
          viewModel.helloText,
          style: TextStyle(fontSize: 48),
        );
      },
    );
  }

  Widget _buildButton(BuildContext context) {
    print("Buton oluştu");
    HomeViewModel viewModel = Provider.of<HomeViewModel>(
      context,
      listen: false,
    );
    return ElevatedButton(
      child: Text("Yazıyı değiştir"),
      onPressed: () {
        viewModel.helloText = "Yazı değişti";
      },
    );
  }

  Widget _buildCheckboxRow(BuildContext context) {
    print("Checkbox satırı oluştu");

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Checkbox: "),
        Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            print("Checkbox - Consumer oluştu");
            return Checkbox(
              value: viewModel.checked,
              onChanged: (bool? newValue) {
                setState(() {
                  if (newValue != null) {
                    viewModel.checked = newValue;
                  }
                });
              },
            );
          },
        ),
      ],
    );
  }
}
