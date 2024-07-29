#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_audio;

#include scripts\zm\remix\_utility;

set_client_dvars()
{
	self setClientDvar( "cg_friendlyNameFadeIn", 0 );
	self setClientDvar( "cg_friendlyNameFadeOut", 250 );
	self setClientDvar( "cg_enemyNameFadeIn", 0 );
	self setClientDvar( "cg_enemyNameFadeOut", 250 );

	self setClientDvar( "player_meleeRange", 64 );
	self setClientDvar( "aim_automelee_enabled", 0 );

	self setClientDvar( "g_friendlyfireDist", 0 );
}

set_character_option()
{
	create_dvar( "character", 0 );

	if ( level.force_team_characters != 1 && getDvar("mapname") != "zm_tomb" && getDvar("mapname") != "zm_prison" ) 
	{	
		switch( getDvarInt("character") )
		{
			case 1:
				self setviewmodel( "c_zom_farmgirl_viewhands" );
				self.voice = "american";
				self.skeleton = "base";
				self setviewmodel( "c_zom_farmgirl_viewhands" );
				level.vox zmbvoxinitspeaker( "player", "vox_plr_", self );
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = "rottweil72_zm";
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = "870mcs_zm";
				self set_player_is_female( 1 );
				self.characterindex = 2;
				if( level.script == "zm_highrise" )
				{
					self setmodel( "c_zom_player_farmgirl_dlc1_fb" );
					self.whos_who_shader = "c_zom_player_farmgirl_dlc1_fb";
				}
				break;
			case 2:
				self setmodel( "c_zom_player_oldman_fb" );
				self.voice = "american";
				self.skeleton = "base";
				self setviewmodel( "c_zom_oldman_viewhands" );
				level.vox zmbvoxinitspeaker( "player", "vox_plr_", self );
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = "frag_grenade_zm";
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = "claymore_zm";
				self set_player_is_female( 0 );
				self.characterindex = 0;
				if( level.script == "zm_highrise" )
				{
					self setmodel( "c_zom_player_oldman_dlc1_fb" );
					self.whos_who_shader = "c_zom_player_oldman_dlc1_fb";
				}
				break;
			case 3:
				self setmodel( "c_zom_player_reporter_fb" );
				self.voice = "american";
				self.skeleton = "base";
				self setviewmodel( "c_zom_reporter_viewhands" );
				level.vox zmbvoxinitspeaker( "player", "vox_plr_", self );
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = "beretta93r_zm";
				self.talks_in_danger = 1;
				level.rich_sq_player = self;
				self set_player_is_female( 0 );
				self.characterindex = 1;
				if( level.script == "zm_highrise" )
				{
					self setmodel( "c_zom_player_reporter_dlc1_fb" );
					self.whos_who_shader = "c_zom_player_reporter_dlc1_fb";
				}
				break;
			case 4:
				self setmodel( "c_zom_player_engineer_fb" );
				self.voice = "american";
				self.skeleton = "base";
				self setviewmodel( "c_zom_engineer_viewhands" );
				level.vox zmbvoxinitspeaker( "player", "vox_plr_", self );
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = "m14_zm";
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = "m16_zm";
				self set_player_is_female( 0 );
				self.characterindex = 3;
				if( level.script == "zm_highrise" )
				{
					self setmodel( "c_zom_player_engineer_dlc1_fb" );
					self.whos_who_shader = "c_zom_player_engineer_dlc1_fb";
				}
				break;
		}
	}
}

disable_player_quotes()
{
	create_dvar( "disable_player_quotes", 0 );
    
    self endon("disconnect");
    for(;;)
    {
		if( getDvarInt( "disable_player_quotes" ) )
		{
			self.isspeaking = 1;
		}
		wait 0.5;
	}
}
