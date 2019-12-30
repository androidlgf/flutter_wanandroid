import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_common/components/animation/vignettes/ticket_fold/ticket_data.dart';

import 'flight_summary.dart';
import 'ticket.dart';

class TicketFoldPage extends StatefulWidget {
  @override
  State createState() => _TicketFoldPageState();
}

class _TicketFoldPageState extends State<TicketFoldPage> {
  final ScrollController _scrollController = ScrollController();
  final List<BoardingPassData> _boardingPasses = TicketData().boardingPasses;
  final List<int> _openTickets = [];

  @override
  Widget build(BuildContext context) {
    final listWidget = ListView.separated(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        itemCount: _boardingPasses.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(height: 20.0);
        },
        itemBuilder: (BuildContext context, int index) {
          return Ticket(
              boardingPass: _boardingPasses[index],
              onClick: () => _handleClickedTicket(index));
        });
    final Widget bodyWidget = Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[Expanded(child: listWidget)],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('ticket'),
      ),
      body: bodyWidget,
    );
  }

  _handleClickedTicket(clickedTicket) {
    // Scroll to ticket position
    // Add or remove the item of the list of open tickets
    _openTickets.contains(clickedTicket)
        ? _openTickets.remove(clickedTicket)
        : _openTickets.add(clickedTicket);

    // Calculate heights of the open and closed elements before the clicked item
    double openTicketsOffset =
        Ticket.nominalOpenHeight * _getOpenTicketsBefore(clickedTicket);
    double closedTicketsOffset = Ticket.nominalClosedHeight *
        (clickedTicket - _getOpenTicketsBefore(clickedTicket));

    double offset = openTicketsOffset +
        closedTicketsOffset -
        (Ticket.nominalClosedHeight * .25);

    // Scroll to the clicked element
    _scrollController.animateTo(max(0, offset),
        duration: Duration(seconds: 1),
        curve: Interval(.25, 1, curve: Curves.easeOutQuad));
    // Return true to stop the notification propagation
    return true;
  }

  _getOpenTicketsBefore(int ticketIndex) {
    // Search all indexes that are smaller to the current index in the list of indexes of open tickets
    return _openTickets.where((int index) => index < ticketIndex).length;
  }
}
