import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets2/custom_expansion_tile.dart';
import '../../../widgets2/custom_tile.dart';
import 'bloc/theme_bloc.dart';
import 'bloc/theme_event.dart';
import 'bloc/theme_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.06;
    final width = MediaQuery.of(context).size.width * 0.42;

    final themeBloc = context.read<ThemeBloc>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor2,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor2,
        title: Text('Settings', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Appearance',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(height: 10),
              CustomTile(
                iconData: Icons.light,
                text: 'Theme',
                widget: SizedBox(
                  height: 20,
                  child: Transform.scale(
                    scale: 0.8,

                    child: Switch(
                      value: themeBloc.state.appTheme == AppTheme.dark,
                      onChanged: (bool value) {
                        context.read<ThemeBloc>().add(
                          ToggleTheme(value ? AppTheme.dark : AppTheme.light),
                        );
                      },
                      activeTrackColor: AppColors.accentBlueDarkColor,
                    ),
                  ),
                ),
                color: AppColors.primaryColor2,
              ),
              SizedBox(height: 50),

              Text(
                'Support',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),

              SizedBox(height: 10),

              SizedBox(height: 10),
              CustomExpansionTile(),
            ],
          ),
        ),
      ),
    );
  }
}
