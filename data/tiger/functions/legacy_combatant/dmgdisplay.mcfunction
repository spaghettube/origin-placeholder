#calc dmg display
$with id uuid @s with dmgdisplay calculate "$(simpledmg)*(((0$(mult)+1)/$(fake_crit))-3*(0$(amplifier)+1))" data modify storage tiger:legcombat @(id).dmgdisplay set value @(dmgdisplay)

#check slot swap
scoreboard players operation @s tempdmgdisplay = @s dmgdisplay
with id uuid @s execute store result score @s dmgdisplay run data get storage tiger:legcombat @(id).dmgdisplay 100000

#handle decimals
with id uuid @s data modify storage tiger:legcombat @(id).dmgdisplay set string storage tiger:legcombat @(id).dmgdisplay 0 -2
with id uuid @s data modify storage tiger:legcombat @(id).dmgdisplay set string storage tiger:legcombat @(id).dmgdisplay 0 4

#show on title
execute unless score @s tempdmgdisplay = @s dmgdisplay run with id uuid @s title @s actionbar [{"text":"Damage: "},{"storage":"tiger:legcombat","nbt":"@(id).dmgdisplay","color":"red"}]