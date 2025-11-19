#calc dmg display
execute if score @s atkspd matches ..1989 run with spd attribute @s minecraft:generic.attack_speed with dmg attribute @s minecraft:generic.attack_damage with simplespd calculate "((4-(200-0@(spd)))^2)^(1/2)" with simpledmg calculate "((0@(dmg))^2)^(1/2)" with dmgdisplay calculate "(1.8^((0-0.05)*@(simpledmg)-0.01*@(simplespd)))*(0.28*@(simpledmg)+0.24*@(simplespd)*@(simpledmg)+0.87*@(simplespd)^(0.5))" with id uuid @s data merge storage tiger:dmgdisplay {@(id):@(dmgdisplay)}
execute if score @s atkspd matches 1990.. run with dmg attribute @s minecraft:generic.attack_damage with simpledmg calculate "((0@(dmg))^2)^(1/2)" with dmgdisplay calculate "(1.8^((0-0.05)*@(simpledmg)-0.029))*(0.976*@(simpledmg)+1.481)" with id uuid @s data merge storage tiger:dmgdisplay {@(id):@(dmgdisplay)}

#check slot swap
scoreboard players operation @s tempdmgdisplay = @s dmgdisplay
with id uuid @s execute store result score @s dmgdisplay run data get storage tiger:dmgdisplay @(id) 100000

#handle decimals
with id uuid @s data modify storage tiger:dmgdisplay @(id) set string storage tiger:dmgdisplay @(id) 0 -1
with id uuid @s data modify storage tiger:dmgdisplay @(id) set string storage tiger:dmgdisplay @(id) 0 4

#show on title
execute unless score @s tempdmgdisplay = @s dmgdisplay run title @s actionbar ""
execute unless score @s tempdmgdisplay = @s dmgdisplay unless score @s dmgdisplay matches 234551 run with id uuid @s title @s actionbar [{"text":"Damage: "},{"storage":"tiger:dmgdisplay","nbt":"@(id)","color":"red"}]