$with id uuid @s data modify storage tiger:legcombat @(id).mult set value $(mult)
$with id uuid @s data modify storage tiger:legcombat @(id).simpledmg set value $(simpledmg)
$with id uuid @s data modify storage tiger:legcombat @(id).fake_crit set value $(fake_crit)
$with id uuid @s data modify storage tiger:legcombat @(id).amplifier set value $(amplifier)
$attribute @s minecraft:generic.attack_damage modifier add 1-1-1-1-1 legdmg $(mult) multiply