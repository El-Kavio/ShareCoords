tellraw @a ["",{"text":"SHARE","color":"aqua"},{"text":"COORDS","color":"yellow"},{"text":" activated!","color":"green"}]

scoreboard objectives add ShareCoords trigger
scoreboard objectives add Switch_SC trigger

scoreboard objectives add SC_Limit dummy
scoreboard objectives add SC_Tracked dummy

scoreboard objectives add SC_X dummy
scoreboard objectives add SC_Y dummy
scoreboard objectives add SC_Z dummy

scoreboard objectives add SC_absX dummy
scoreboard objectives add SC_absZ dummy

scoreboard objectives add SC_Dist dummy
scoreboard objectives add SC_DistF dummy
scoreboard objectives add SC_DistF2 dummy
scoreboard objectives add SC_DistFF dummy

scoreboard objectives add SC_GoE dummy
scoreboard objectives add SC_GoE2 dummy
scoreboard objectives add SC_GoE0 dummy
scoreboard objectives add SC_GoE02 dummy

scoreboard objectives add SC_L dummy
scoreboard objectives add SC_L2 dummy
scoreboard objectives add SC_L0 dummy
scoreboard objectives add SC_L02 dummy

scoreboard objectives add SC_var dummy
scoreboard objectives add SC_var2 dummy
scoreboard objectives add SC_var0 dummy
scoreboard objectives add SC_var02 dummy

scoreboard players set #SC_-1 SC_Dist -1
scoreboard players set #SC_8 SC_Dist 8
