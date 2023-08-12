# Manhattan distance calculation

# Get Players Pos X and Z
execute as @a store result score @s SC_X run data get entity @s Pos[0] 1
execute as @a store result score @s SC_Z run data get entity @s Pos[2] 1

# Transfer Pos X and Z to new scoreboard
execute as @a store result score @s SC_absX run scoreboard players get @s SC_X
execute as @a store result score @s SC_absZ run scoreboard players get @s SC_Z

# ##### Manhattan distance formula (good luck understanding it (that is hightly probable that this code is pretty bad and unoptimised, at least it works fine... (I hope...)))

# Greater or Equal X
execute as @a if score @s[scores={SC_Dist=0}] SC_absX >= @a[scores={SC_Dist=1},limit=1] SC_absX run scoreboard players set @s[scores={SC_Dist=0}] SC_var 1
execute as @a[scores={SC_var=1}] store result score @s SC_GoE run scoreboard players get @s[scores={SC_Dist=0}] SC_absX
execute as @a[scores={SC_var=1}] store result score @s SC_GoE2 run scoreboard players get @a[scores={SC_Dist=1},limit=1] SC_absX
execute as @a[scores={SC_var=1}] store result score @s SC_GoE2 run scoreboard players operation @s[scores={SC_Dist=0}] SC_GoE -= @s[scores={SC_Dist=0}] SC_GoE2

# Less X
execute as @a if score @s[scores={SC_Dist=0}] SC_absX < @a[scores={SC_Dist=1},limit=1] SC_absX run scoreboard players set @s[scores={SC_Dist=0}] SC_var2 1
execute as @a[scores={SC_var2=1}] store result score @s SC_L run scoreboard players get @s[scores={SC_Dist=0}] SC_absX
execute as @a[scores={SC_var2=1}] store result score @s SC_L2 run scoreboard players get @a[scores={SC_Dist=1},limit=1] SC_absX
execute as @a[scores={SC_var2=1}] store result score @s SC_L2 run scoreboard players operation @s[scores={SC_Dist=0}] SC_L2 -= @s[scores={SC_Dist=0}] SC_L

# Greater or Equal Z
execute as @a if score @s[scores={SC_Dist=0}] SC_absZ >= @a[scores={SC_Dist=1},limit=1] SC_absZ run scoreboard players set @s[scores={SC_Dist=0}] SC_var0 1
execute as @a[scores={SC_var0=1}] store result score @s SC_GoE0 run scoreboard players get @s[scores={SC_Dist=0}] SC_absZ
execute as @a[scores={SC_var0=1}] store result score @s SC_GoE02 run scoreboard players get @a[scores={SC_Dist=1},limit=1] SC_absZ
execute as @a[scores={SC_var0=1}] store result score @s SC_GoE02 run scoreboard players operation @s[scores={SC_Dist=0}] SC_GoE0 -= @s[scores={SC_Dist=0}] SC_GoE02

# Less Z
execute as @a if score @s[scores={SC_Dist=0}] SC_absZ < @a[scores={SC_Dist=1},limit=1] SC_absZ run scoreboard players set @s[scores={SC_Dist=0}] SC_var02 1
execute as @a[scores={SC_var02=1}] store result score @s SC_L0 run scoreboard players get @s[scores={SC_Dist=0}] SC_absZ
execute as @a[scores={SC_var02=1}] store result score @s SC_L02 run scoreboard players get @a[scores={SC_Dist=1},limit=1] SC_absZ
execute as @a[scores={SC_var02=1}] store result score @s SC_L02 run scoreboard players operation @s[scores={SC_Dist=0}] SC_L02 -= @s[scores={SC_Dist=0}] SC_L0

# Absolute value
execute as @a[scores={SC_Dist=0,SC_GoE2=..-1}] run scoreboard players operation @s[scores={SC_Dist=0}] SC_GoE2 *= #SC_-1 SC_Dist
execute as @a[scores={SC_Dist=0,SC_L2=..-1}] run scoreboard players operation @s[scores={SC_Dist=0}] SC_L2 *= #SC_-1 SC_Dist
execute as @a[scores={SC_Dist=0,SC_GoE02=..-1}] run scoreboard players operation @s[scores={SC_Dist=0}] SC_GoE02 *= #SC_-1 SC_Dist
execute as @a[scores={SC_Dist=0,SC_L02=..-1}] run scoreboard players operation @s[scores={SC_Dist=0}] SC_L02 *= #SC_-1 SC_Dist

# Final distance
scoreboard players set @a SC_DistF 0

execute as @a store result score @s SC_DistF run scoreboard players operation @s SC_GoE2 += @s SC_L2
execute as @a store result score @s SC_DistF2 run scoreboard players operation @s SC_GoE02 += @s SC_L02
execute as @a store result score @s SC_DistFF run scoreboard players operation @s SC_DistF += @s SC_DistF2

# #####

# x blocks away from entity that triggered the command
execute as @a if entity @a[scores={ShareCoords=1},nbt={Dimension:"minecraft:the_nether"}] if entity @s[scores={SC_Dist=0},nbt={Dimension:"minecraft:the_nether"}] run tellraw @s[scores={SC_Dist=0}] ["",{"score":{"name":"@s","objective":"SC_DistFF"},"color":"yellow"},{"text":" blocks away...","color":"aqua"}]
execute as @a if entity @a[scores={ShareCoords=1},nbt={Dimension:"minecraft:overworld"}] if entity @s[scores={SC_Dist=0},nbt={Dimension:"minecraft:overworld"}] run tellraw @s[scores={SC_Dist=0}] ["",{"score":{"name":"@s","objective":"SC_DistFF"},"color":"yellow"},{"text":" blocks away...","color":"aqua"}]
execute as @a if entity @a[scores={ShareCoords=1},nbt={Dimension:"minecraft:the_end"}] if entity @s[scores={SC_Dist=0},nbt={Dimension:"minecraft:the_end"}] run tellraw @s[scores={SC_Dist=0}] ["",{"score":{"name":"@s","objective":"SC_DistFF"},"color":"yellow"},{"text":" blocks away...","color":"aqua"}]


scoreboard players set @a SC_Dist 0
scoreboard players set @a SC_DistF 0
scoreboard players set @a SC_DistF2 0
scoreboard players set @a SC_DistFF 0

scoreboard players set @a SC_var 0
scoreboard players set @a SC_var2 0
scoreboard players set @a SC_var0 0
scoreboard players set @a SC_var02 0

scoreboard players set @a SC_GoE 0
scoreboard players set @a SC_GoE2 0
scoreboard players set @a SC_GoE0 0
scoreboard players set @a SC_GoE02 0

scoreboard players set @a SC_L 0
scoreboard players set @a SC_L2 0
scoreboard players set @a SC_L0 0
scoreboard players set @a SC_L02 0

# Activate particles (see "# Switch" in tick.mcfunction)
scoreboard players set @a SC_Limit 1 