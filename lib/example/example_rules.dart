library gol.example.example_rules;

import 'package:gol/rule.dart';
import 'package:gol/cell.dart';

/// Helpers.

/// Returns true if [cell]'s previous state is [CellState.ON]
bool _wasOn(Cell cell) => cell.previousState == CellState.ON;

/// Returns true if [cell]'s current state is [CellState.ON]
bool _isOn(Cell cell) => cell.state == CellState.ON;

/// If one of [cell]'s [neighbors] is on and [cell] is off, cell turns on. Else
/// cell turns off.
Rule onIf1OnAndOff = new Rule((Cell cell, List<Cell> neighbors) {
  if (neighbors.any(_wasOn) && !_isOn(cell)) {
    return CellState.ON;
  } else {
    return CellState.OFF;
  }
});

/// If two of [cell]'s [neighbors] is on and [cell] is off, cell turns on. Else
/// cell turns off.
Rule onIf2On = new Rule((Cell cell, List<Cell> neighbors) {
  if (neighbors.where(_wasOn).length == 2 && !_isOn(cell)) {
    return CellState.ON;
  }
  return CellState.OFF;
});

/// If one of [cell]'s [neighbors] is on, [cell] is turned on.
/// If all of [cell]'s [neighbors] are on, [cell] is turned off.
/// Else cell is left unchnaged.
Rule onIf1OnOffIf3On = new Rule((Cell cell, List<Cell> neighbors) {
  if (neighbors.every(_wasOn)) {
    return CellState.OFF;
  }

  if (neighbors.where(_wasOn).length == 1) {
    return CellState.ON;
  }

  return cell.state;
});
