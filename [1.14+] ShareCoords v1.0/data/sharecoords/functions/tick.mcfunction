# set score for players (otherwise null by default)
scoreboard players enable @a ShareCoords
scoreboard players enable @a Switch_SC
execute as @a unless entity @s[scores={ShareCoords=0..}] run scoreboard players add @a ShareCoords 0
execute as @a unless entity @s[scores={Switch_SC=0..}] run scoreboard players set @a Switch_SC 1

execute as @a unless entity @s[scores={SC_Limit=0..}] run scoreboard players add @a SC_Limit 0
execute as @a unless entity @s[scores={SC_Tracked=0..}] run scoreboard players add @a SC_Tracked 0

execute as @a unless entity @s[scores={SC_X=0..}] run scoreboard players add @a SC_X 0
execute as @a unless entity @s[scores={SC_Y=0..}] run scoreboard players add @a SC_Y 0
execute as @a unless entity @s[scores={SC_Z=0..}] run scoreboard players add @a ShareCoSC_Zords 0

execute as @a unless entity @s[scores={SC_absX=0..}] run scoreboard players add @a SC_absX 0
execute as @a unless entity @s[scores={SC_absZ=0..}] run scoreboard players add @a SC_absZ 0

execute as @a unless entity @s[scores={SC_Dist=0..}] run scoreboard players add @a SC_Dist 0
execute as @a unless entity @s[scores={SC_DistF=0..}] run scoreboard players add @a SC_DistF 0
execute as @a unless entity @s[scores={SC_DistF2=0..}] run scoreboard players add @a SC_DistF2 0
execute as @a unless entity @s[scores={SC_DistFF=0..}] run scoreboard players add @a SC_DistFF 0

execute as @a unless entity @s[scores={SC_GoE=0..}] run scoreboard players add @a SC_GoE 0
execute as @a unless entity @s[scores={SC_GoE2=0..}] run scoreboard players add @a SC_GoE2 0
execute as @a unless entity @s[scores={SC_GoE0=0..}] run scoreboard players add @a SC_GoE0 0
execute as @a unless entity @s[scores={SC_GoE02=0..}] run scoreboard players add @a SC_GoE02 0

execute as @a unless entity @s[scores={SC_L=0..}] run scoreboard players add @a SC_L 0
execute as @a unless entity @s[scores={SC_L2=0..}] run scoreboard players add @a SC_L2 0
execute as @a unless entity @s[scores={SC_L0=0..}] run scoreboard players add @a SC_L0 0
execute as @a unless entity @s[scores={SC_L02=0..}] run scoreboard players add @a SC_L02 0

execute as @a unless entity @s[scores={SC_var=0..}] run scoreboard players add @a SC_var 0
execute as @a unless entity @s[scores={SC_var2=0..}] run scoreboard players add @a SC_var2 0
execute as @a unless entity @s[scores={SC_var0=0..}] run scoreboard players add @a SC_var0 0
execute as @a unless entity @s[scores={SC_var02=0..}] run scoreboard players add @a SC_var02 0

# Code start
execute as @a if entity @s[scores={ShareCoords=1}] run scoreboard players set @s[scores={ShareCoords=1}] SC_Dist 1

execute as @a[scores={ShareCoords=1}] store result score @s SC_X run data get entity @s Pos[0] 1
execute as @a[scores={ShareCoords=1}] store result score @s SC_Y run data get entity @s Pos[1] 1
execute as @a[scores={ShareCoords=1}] store result score @s SC_Z run data get entity @s Pos[2] 1

execute as @a[scores={ShareCoords=1},nbt={Dimension:"minecraft:the_nether"}] run tellraw @a ["",{"selector":"@s[scores={ShareCoords=1..}]","color":"aqua"},{"text":" is located at ","color":"gray"},{"text":"[","color":"aqua"},{"score":{"name":"@s","objective":"SC_X"},"color":"yellow"},{"text":", ","color":"aqua"},{"score":{"name":"@s","objective":"SC_Y"},"color":"yellow"},{"text":", ","color":"aqua"},{"score":{"name":"@s","objective":"SC_Z"},"color":"yellow"},{"text":"] ","color":"aqua"},{"text":"in the ","color":"gray"},{"text":"Nether","color":"dark_red"}]
execute as @a[scores={ShareCoords=1},nbt={Dimension:"minecraft:overworld"}] run tellraw @a ["",{"selector":"@s[scores={ShareCoords=1..}]","color":"aqua"},{"text":" is located at ","color":"gray"},{"text":"[","color":"aqua"},{"score":{"name":"@s","objective":"SC_X"},"color":"yellow"},{"text":", ","color":"aqua"},{"score":{"name":"@s","objective":"SC_Y"},"color":"yellow"},{"text":", ","color":"aqua"},{"score":{"name":"@s","objective":"SC_Z"},"color":"yellow"},{"text":"] ","color":"aqua"},{"text":"in the ","color":"gray"},{"text":"Overworld","color":"dark_green"}]
execute as @a[scores={ShareCoords=1},nbt={Dimension:"minecraft:the_end"}] run tellraw @a ["",{"selector":"@s[scores={ShareCoords=1..}]","color":"aqua"},{"text":" is located at ","color":"gray"},{"text":"[","color":"aqua"},{"score":{"name":"@s","objective":"SC_X"},"color":"yellow"},{"text":", ","color":"aqua"},{"score":{"name":"@s","objective":"SC_Y"},"color":"yellow"},{"text":", ","color":"aqua"},{"score":{"name":"@s","objective":"SC_Z"},"color":"yellow"},{"text":"] ","color":"aqua"},{"text":"in the ","color":"gray"},{"text":"End","color":"gold"}]
execute as @a[scores={ShareCoords=1},nbt=!{Dimension:"minecraft:the_nether"},nbt=!{Dimension:"minecraft:overworld"},nbt=!{Dimension:"minecraft:the_end"}] run tellraw @a ["",{"selector":"@s[scores={ShareCoords=1..}]","color":"aqua"},{"text":" is located at ","color":"gray"},{"text":"[","color":"aqua"},{"score":{"name":"@s","objective":"SC_X"},"color":"yellow"},{"text":", ","color":"aqua"},{"score":{"name":"@s","objective":"SC_Y"},"color":"yellow"},{"text":", ","color":"aqua"},{"score":{"name":"@s","objective":"SC_Z"},"color":"yellow"},{"text":"] ","color":"aqua"},{"text":"in ","color":"gray"},{"text":"unknown dimension","color":"blue"}]


execute as @a if entity @s[scores={ShareCoords=1}] run function sharecoords:dist_calc
execute as @a if entity @a[scores={ShareCoords=1}] run scoreboard players set @a SC_Tracked 0
execute as @a[scores={ShareCoords=1}] run scoreboard players set @s SC_Tracked 1
execute as @a[scores={ShareCoords=1}] run scoreboard players set @s ShareCoords 0

# Switch

execute as @a[scores={Switch_SC=2..}] run scoreboard players set @s Switch_SC 0

execute as @a[scores={Switch_SC=1},nbt={Dimension:"minecraft:the_nether"}] if entity @a[scores={SC_Tracked=1},nbt={Dimension:"minecraft:the_nether"}] unless entity @s[scores={SC_Tracked=1}] unless entity @s[scores={SC_Limit=0}] run function sharecoords:switch_particles
execute as @a[scores={Switch_SC=1},nbt={Dimension:"minecraft:overworld"}] if entity @a[scores={SC_Tracked=1},nbt={Dimension:"minecraft:overworld"}] unless entity @s[scores={SC_Tracked=1}] unless entity @s[scores={SC_Limit=0}] run function sharecoords:switch_particles
execute as @a[scores={Switch_SC=1},nbt={Dimension:"minecraft:the_end"}] if entity @a[scores={SC_Tracked=1},nbt={Dimension:"minecraft:the_end"}] unless entity @s[scores={SC_Tracked=1}] unless entity @s[scores={SC_Limit=0}] run function sharecoords:switch_particles
# Adjust time in tick (here 400t for 20seconds)
execute as @a[scores={SC_Limit=1..400}] run scoreboard players add @s SC_Limit 1
execute as @a[scores={SC_Limit=400..}] run scoreboard players set @s SC_Limit 0