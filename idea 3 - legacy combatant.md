idea 3 - legacy combatant

an origin to replicate a "1.8 pvp" player

this origin is meant for those legacy pvp crutchers, either to make them more comfortable playing on newer versions, or to make them realistically be on equal footing on a one on one battle in newer versions

the toughest part about this origin will surely be balancing combat with one less variable (attack cooldown)

the idea is to make the player's abilities as default's as a human's, whilst merging them with "1.8 pvp"

### passive abilities
- no attack cooldown
- damage nerf (has to be %)
- no shield

### active abilities
- allow projectile knockback (gotta figure this out technically)

probably useful:
on origin join:
attribute @s minecraft:generic.attack_speed base set 200

every tick:
execute store result score @s atkspd run attribute @s minecraft:generic.attack_speed get 10

# vanilla display speed is @(truespd)=4-(200-@(spd)), @(spd) being new display speed, @(delta) is what should be applied (additive), unoptimized formula would be (2.1^(0.05*((@(truespd)^2)^(1/2)))*((@(dmg)^0.55)+(@(truespd)-1))+1)-@(dmg)
execute if score @s atkspd matches 1..1989 run with spd attribute @s minecraft:generic.attack_speed with dmg attribute @s minecraft:generic.attack_damage with delta calculate "(2.1^(0.05*(((4-(200-@(spd)))^2)^(1/2)))*((@(dmg)^0.55)+((4-(200-@(spd)))-1))+1)-@(dmg)" say @(delta) @(dmg) @(spd)
# (my custom) threshold speed for vanilla display speed is 2.9, setting value 3.0 to truespd on the equation, for the tools that surpass it:
execute if score @s atkspd matches 1990.. run with spd attribute @s minecraft:generic.attack_speed with dmg attribute @s minecraft:generic.attack_damage with delta calculate "1.116*(@(dmg)^0.55)-@(dmg)+3.232" say @(delta) @(dmg)
