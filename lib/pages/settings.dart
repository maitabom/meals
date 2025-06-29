import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsPage extends StatefulWidget {
  final Settings settings;
  final ValueChanged<Settings> onSettingsChange;
  const SettingsPage(this.onSettingsChange, this.settings, {super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget createdSwitch(
    String title,
    String subtitle,
    bool checked,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: checked,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações')),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                createdSwitch(
                  'Sem Glúten',
                  'Exibir apenas as refeições sem glútem',
                  settings.glutenFree,
                  (value) => setState(() {
                    settings.glutenFree = value;
                  }),
                ),
                createdSwitch(
                  'Sem Lactose',
                  'Exibir apenas as refeições sem lactose',
                  settings.lactoseFree,
                  (value) => setState(() {
                    settings.lactoseFree = value;
                  }),
                ),
                createdSwitch(
                  'Vegana',
                  'Exibir apenas as refeições veganas',
                  settings.vegan,
                  (value) => setState(() {
                    settings.vegan = value;
                  }),
                ),
                createdSwitch(
                  'Vegetariana',
                  'Exibir apenas as refeições vegetarianas',
                  settings.vegetarian,
                  (value) => setState(() {
                    settings.vegetarian = value;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
