/obj/effect/proc_holder/spell/targeted/click/alien/
	name = "Alien Spell"
	desc = "If you see this, someone messed up! Please report it!"
	action_icon = 'icons/mob/actions/actions_xeno.dmi'
	auto_target_single = FALSE
	clothes_req = FALSE
	range = 1
	cooldown_min = 1
	action_background_icon_state = "bg_alien"
	var/required_plasma = 0

	//var/mob/living/carbon/user = usr
	//if(user.get_organ_slot("plasmavessel") = TRUE)
		//var/plasma = 100

/obj/effect/proc_holder/spell/targeted/click/alien/neurotoxin //functioning spell code babeeeeee
	name = "Neurotoxin"
	desc = "Spit a glob of neurotoxin at your enemies."

	var/neurotoxin_type = /obj/item/projectile/bullet/neurotoxin
	var/neurotoxin_on_click = 0
	action_icon = 'icons/mob/actions/actions_xeno.dmi'
	action_icon_state = "alien_neurotoxin_0"
	sound = 'sound/magic/fireball.ogg'
	action_background_icon_state = "bg_alien"

	click_radius = -1
	allowed_type = /atom
	clothes_req = FALSE
	range = 20
	cooldown_min = 5
	required_plasma = 100

	selection_activated_message		= "<span class='alertalien'>You feel your neurotoxic glands fill! <B>Left-click to spit at a target!</B></span>"
	selection_deactivated_message	= "<span class='alertalien'>You feel your neurotoxic glands empty.</span>"
	allowed_type = /atom

	active = FALSE

/obj/effect/proc_holder/spell/targeted/click/alien/neurotoxin/update_icon()
	neurotoxin_on_click = !neurotoxin_on_click
	action.button_icon_state = "alien_neurotoxin_[neurotoxin_on_click ? "1":"0"]"
	action.UpdateButtonIcon()

/obj/effect/proc_holder/spell/targeted/click/alien/neurotoxin/cast(list/targets, mob/living/user = usr)
	var/target = targets[1] //There is only ever one target
	var/turf/T = user.loc
	var/turf/U = get_step(user, user.dir) // Get the tile infront of the move, based on their direction
	if(!isturf(U) || !isturf(T))
		return FALSE

	var/obj/item/projectile/bullet/neurotoxin/NT = new neurotoxin_type(user.loc)
	NT.current = get_turf(user)
	NT.preparePixelProjectile(target, get_turf(target), user)
	NT.fire()
	user.newtonian_move(get_dir(U, T))

	/*var/mob/living/carbon/user = usr

	if(user.get_organ_slot("plasmavessel"))
		if(user.powerc <= required_plasma)
			user.adjustPlasma(-100)*/

	return TRUE

/obj/effect/proc_holder/spell/targeted/click/alien/strong_neurotoxin
	name = "Strong Neurotoxin"
	desc = "Spit a glob of strong neurotoxin at your enemies."

	var/neurotoxin_type = /obj/item/projectile/bullet/neurotoxin
	var/strong_neurotoxin_on_click = 0
	action_icon = 'icons/mob/actions/actions_xeno.dmi'
	action_icon_state = "alien_neurotoxin_0"
	/*action_background_icon_state = "bg_alien"*/
	sound = 'sound/magic/fireball.ogg'

	click_radius = -1
	allowed_type = /atom
	auto_target_single = FALSE
	clothes_req = FALSE
	range = 20
	cooldown_min = 5
	required_plasma = 100

	selection_activated_message		= "<span class='alertalien'>You feel your strong neurotoxic glands fill! <B>Left-click to spit at a target!</B></span>"
	selection_deactivated_message	= "<span class='alertalien'>You feel your strong neurotoxic glands empty.</span>"
	allowed_type = /atom

	active = FALSE

/obj/effect/proc_holder/spell/targeted/click/alien/strong_neurotoxin/update_icon()
	strong_neurotoxin_on_click = !strong_neurotoxin_on_click
	action.button_icon_state = "alien_neurotoxin_[strong_neurotoxin_on_click ? "1":"0"]"
	action.UpdateButtonIcon()

/obj/effect/proc_holder/spell/targeted/click/alien/strong_neurotoxin/cast(list/targets, mob/living/user = usr)
	var/target = targets[1] //There is only ever one target
	var/turf/T = user.loc
	var/turf/U = get_step(user, user.dir) // Get the tile infront of the move, based on their direction
	if(!isturf(U) || !isturf(T))
		return FALSE

	var/obj/item/projectile/bullet/neurotoxin/NT = new neurotoxin_type(user.loc) //notable: this is identical to normal neurotoxin. Needs new projectile.
	NT.current = get_turf(user)
	NT.preparePixelProjectile(target, get_turf(target), user)
	NT.fire()
	user.newtonian_move(get_dir(U, T))

	return TRUE

/obj/effect/proc_holder/spell/aoe_turf/alien/
	name = "Alien Spell"
	desc = "If you see this, someone messed up! Please report it!"
	action_icon = 'icons/mob/actions/actions_xeno.dmi'
	clothes_req = FALSE
	range = 1
	cooldown_min = 1
	action_background_icon_state = "bg_alien"
	var/required_plasma = 0

/obj/effect/proc_holder/spell/aoe_turf/alien/plantweeds
	name = "Plant Weeds"
	desc = "Plants some alien weeds"
	range = 1
	charge_max = 250
	clothes_req = 0
	action_icon_state = "alien_plant"
	cooldown_min = 5
	required_plasma = 25

/obj/effect/proc_holder/spell/aoe_turf/plantweeds/cast(list/targets, mob/user = usr) //does not work. ripped straight from og ability code, needs new solution
	to_chat(user, "<span class='shadowling'>You plant a weed.</span>")
	playsound(user.loc, 'sound/effects/ghost2.ogg', 50, 1)

	if(locate(/obj/structure/alien/weeds/node) in get_turf(src))
		to_chat(src, "<span class='noticealien'>There's already a weed node here.</span>")
		return

	else
		new /obj/structure/alien/weeds/node(loc)

	return
