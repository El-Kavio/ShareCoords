execute as @s at @s run particle minecraft:dust 0 0 0 1 ~2 ~0.5 ~ 0 0 0 0 0 force @s
execute as @s at @s run particle minecraft:dust 0 0 0 1 ~-2 ~0.5 ~ 0 0 0 0 0 force @s
execute as @s at @s run particle minecraft:dust 0 0 0 1 ~ ~0.5 ~2 0 0 0 0 0 force @s
execute as @s at @s run particle minecraft:dust 0 0 0 1 ~ ~0.5 ~-2 0 0 0 0 0 force @s
execute as @s at @s facing entity @a[scores={SC_Tracked=1}] feet run particle minecraft:reverse_portal ~ ~0.5 ~ ^ ^ ^100000 0.00001 0 force @s