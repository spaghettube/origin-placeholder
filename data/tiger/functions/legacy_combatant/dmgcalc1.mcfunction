execute store result score @s atkspd run attribute @s minecraft:generic.attack_speed get 10
attribute @s minecraft:generic.attack_damage modifier remove 1-1-1-1-1

$execute if score @s atkspd matches ..1989 run with spd attribute @s minecraft:generic.attack_speed with dmg attribute @s minecraft:generic.attack_damage with simplespd calculate "((4-(200-0@(spd)))^2)^(1/2)" with simpledmg calculate "((0@(dmg))^2)^(1/2)-3*(0$(amplifier)+1)" with mult calculate "(0-1)+$(fake_crit)*(((1.8^((0-0.05)*@(simpledmg)-0.01*@(simplespd)))*(0.28*@(simpledmg)+0.24*@(simplespd)*@(simpledmg)+0.87*@(simplespd)^(0.5)))+3*(0$(amplifier)+1))/(@(simpledmg)+3*(0$(amplifier)+1))" function tiger:legacy_combatant/dmgcalc2 {simpledmg:@(simpledmg),mult:@(mult),fake_crit:$(fake_crit),amplifier:$(amplifier)}
$execute if score @s atkspd matches 1990.. run with dmg attribute @s minecraft:generic.attack_damage with simpledmg calculate "((0@(dmg))^2)^(1/2)-3*(0$(amplifier)+1)" with mult calculate "(0-1)+$(fake_crit)*(((1.8^((0-0.05)*@(simpledmg)-0.029))*(0.976*@(simpledmg)+1.481))+3*(0$(amplifier)+1))/(@(simpledmg)+3*(0$(amplifier)+1))" function tiger:legacy_combatant/dmgcalc2 {simpledmg:@(simpledmg),mult:@(mult),fake_crit:$(fake_crit),amplifier:$(amplifier)}

with id uuid @s function tiger:legacy_combatant/dmgdisplay with storage tiger:legcombat @(id)

execute store result score @s ratio run data get entity @s Attributes.[{Modifiers:[{Name:"legdmg"}]}].Modifiers[].Amount 1000000