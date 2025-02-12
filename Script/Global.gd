extends Node

var piece : String
var who_moves : bool = true #False = black, True = white
var player :bool = true #True = White, False = Black
var win :bool = false

var black_strength : int = 0
var white_strength : int = 0

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
