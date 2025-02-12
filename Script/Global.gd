extends Node

var piece : String
var who_moves : bool = false #False = black, True = white
var white_player :bool = false #White player
var black_player :bool = false #Black palyer

var black_strength : int
var white_strength : int

const SPY : int = 15
const GENERAL_5 : int = 14
const GENERAL_4 : int = 13
const GENERAL_3 : int = 12
const GENERAL_2 : int = 11
const GENERAL_1 : int = 10
const COLONEL : int = 9
const LT_COLONEL : int = 8
const MAJOR : int = 7
const CAPTAIN : int = 6
const LIEUT_1 : int = 5
const LIEUT_2 : int = 4
const SERGEANT : int = 3
const PRIVATE : int = 2
const FLAG : int = 1
