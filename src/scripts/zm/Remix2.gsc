#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_powerups;
#include maps\mp\zombies\_zm_weapons;
#include maps\mp\zombies\_zm_magicbox;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_unitrigger;
#include maps\mp\zombies\_zm_blockers;
#include maps\mp\zombies\_zm_pers_upgrades_system;
#include maps\mp\zombies\_zm_perks;
#include maps\mp\zombies\_zm_stats;
#include maps\mp\zombies\_zm_pers_upgrades_functions;
#include maps\mp\zombies\_zm_weap_claymore;
#include maps\mp\zombies\_zm_melee_weapon;
#include maps\mp\zombies\_zm_craftables;
#include maps\mp\zombies\_zm_equipment;

#include scripts\zm\remix\_players;
#include scripts\zm\remix\_visual;
#include scripts\zm\remix\_hud;
#include scripts\zm\remix\_weapons;
#include scripts\zm\remix\_powerups;
#include scripts\zm\remix\_perks;
#include scripts\zm\remix\_persistent;
#include scripts\zm\remix\_buildables;
#include scripts\zm\remix\_equipment;
#include scripts\zm\remix\_magicbox;
#include scripts\zm\remix\_sharedbox;
#include scripts\zm\remix\_reset;
#include scripts\zm\remix\_utility;
#include scripts\zm\remix\_zombies;
#include scripts\zm\remix\_debug;


main()
{ 
	level.VERSION = "1.0.0";

	replaceFunc( maps\mp\zombies\_zm_powerups::insta_kill_powerup, ::insta_kill_powerup_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::insta_kill_on_hud, ::insta_kill_on_hud_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::double_points_powerup, ::double_points_powerup_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::point_doubler_on_hud, ::point_doubler_on_hud_override );

	replaceFunc( maps\mp\zombies\_zm_weapons::ammo_give, ::ammo_give_override );
	replaceFunc( maps\mp\zombies\_zm_utility::wait_network_frame, ::wait_network_frame_override );
	
    level.initial_spawn = true;
    level thread onConnect();
}

init()
{
	level._effect["fx_zombie_powerup_caution_wave"] = loadfx("misc\fx_zombie_powerup_caution_wave");
}

onConnect()
{
    for (;;)
    {
        level waittill("connected", player);
        player thread connected();
    }
}

connected()
{
    level endon( "game_ended" );
    self endon("disconnect");

    self.initial_spawn = true;

    for(;;)
    {
        self waittill("spawned_player");

    	if(self.initial_spawn)
		{
            self.initial_spawn = false;

			self thread debug( 0 );

			self iprintln("Welcome to Remix Lite!");
			self iPrintLn("Version " + level.VERSION);

			self set_client_dvars();
			self set_character_option();
			// self set_visionset();

			// self graphic_tweaks();
			self thread night_mode();
			// self thread rotate_skydome();

			self thread trap_timer_hud();
			self thread zombie_remaining_hud();
			self thread zone_hud();
			self thread color_hud();
			self thread all_hud_watcher();

			self thread max_ammo_refill_clip();

			self thread disable_player_quotes();
        }

        if(level.initial_spawn)
		{
			level.initial_spawn = false;

			if(GetDvar("customMap") == "")
			{
				SetDvar("customMap", "vanilla");
				level.customMap = GetDvar("customMap");
			}

			level thread change_skydome();
			level thread eye_color_watcher();

			level thread fake_reset();

			level thread shared_box();
			level thread coop_pause();

			flag_wait( "start_zombie_round_logic" );
   			wait 0.05;

			level.perk_purchase_limit = 6;
		}
	}
}