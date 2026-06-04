import 'package:flutter/material.dart';

class Destination {
  const Destination(this.icon, this.label);
  final IconData icon;
  final String label;
}

const List<Destination> destinations = <Destination> [
  Destination(Icons.forward_to_inbox, 'Inbox'),
  Destination(Icons.article, 'Articles'),
  Destination(Icons.messenger, 'Messages'),
  Destination(Icons.group, 'Groups'),
];