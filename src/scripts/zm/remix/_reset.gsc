#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;

fake_reset()
{
    level endon("disconnect");
	level endon("end_game");

    level.win_game = false;
	level.total_time = 0;
	level.paused_time = 0;

	flag_wait( "initial_blackscreen_passed" );

	start_time = int(getTime() / 1000);

    while(1)
    {
        current_time = int(getTime() / 1000);
		level.total_time = (current_time - level.paused_time) - start_time;
		
        if (level.total_time >= 43200) // 12h reset
        {
			map_restart( false );
			//exitlevel( 0 );
			players = Get_Players();	
			for(i=0;i<players.size;i++)
			{
				players[i] FreezeControls( true );
			}
            level.win_game = true;
            level notify( "end_game" );
			break;
        }

        wait 0.05;
    }
}

coop_pause()
{	
	level endon("disconnect");
	level endon("end_game");

	flag_wait( "initial_blackscreen_passed" );

	players = get_players();
	while (players.size > 0) {
		level waittill("say", message, player);

    	if (message == "p")
    	{
			player freezeControls(true);
			player EnableInvulnerability();
			player.ignoreme = true;
			player.paused = true;

			// Create UI
			player.black_hud = NewClientHudElem(player);
			player.black_hud.horzAlign = "fullscreen";
			player.black_hud.vertAlign = "fullscreen";
			player.black_hud SetShader( "black", 640, 480 );
			player.black_hud.alpha = 0;

			player.black_hud FadeOverTime( 1.0 );
			player.black_hud.alpha = 0.7;
			player.black_hud.hidewheninmenu = 1;

			player.paused_hud = NewClientHudElem(player);
			player.paused_hud.horzAlign = "center";
			player.paused_hud.vertAlign = "middle";
			player.paused_hud setText("GAME PAUSED");
			player.paused_hud.foreground = true;
			player.paused_hud.fontScale = 2.3;
			player.paused_hud.x -= 63;
			player.paused_hud.y -= 20;
			player.paused_hud.alpha = 0;
			player.paused_hud.color = ( 1.0, 1.0, 1.0 );
			player.paused_hud.hidewheninmenu = 1;

			player.paused_hud FadeOverTime( 1.0 );
			player.paused_hud.alpha = 0.85;
   		} 
		else if (message == "u") 
		{
			player freezeControls(false);
			player DisableInvulnerability();
			player.ignoreme = false;
			player.paused = false;

			// Destroy UI
			player.paused_hud FadeOverTime( 0.5 );
			player.paused_hud.alpha = 0;
			player.black_hud FadeOverTime( 0.5 );
			player.black_hud.alpha = 0;
			wait 0.5;
			player.black_hud destroy();
			player.paused_hud destroy();
		}
   		wait 0.05; 
	}
}