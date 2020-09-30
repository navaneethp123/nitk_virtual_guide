import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final Widget trailing;
  final Function onTap;

  InfoTile({
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
      leading: leading,
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
