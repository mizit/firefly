var buffer = argument[ 0 ];
   var msgid = buffer_read( buffer , buffer_u8 );
   switch( msgid ) {
      case NET_GOOD_DAY:
      {
        var t;
        t = buffer_read(buffer, buffer_u16);
        if (t != 0)
        {
            global.myid = t;
            obj_ship.image_angle = buffer_read(buffer, buffer_f32);
            obj_ship.x = buffer_read(buffer, buffer_f32);
            obj_ship.y = buffer_read(buffer, buffer_f32);
            obj_ship.topical_data = 1;
            give_me_all_data();
        }
        else
        {
            show_message("Incorrect password");
            game_restart();
        }
        break;
      }
      case NET_BASE_DATA:
      {
        var p;
        var bship = noone;
        p = buffer_read( buffer , buffer_s32);
        p = buffer_read(buffer, buffer_string);
        if (p == login)
        {
            break;
        }
        for (i = 0; i < instance_number(obj_enemy_ship); i++)
        {
            if (instance_find(obj_enemy_ship, i).pid == p)
            {
                bship = instance_find(obj_enemy_ship, i);
            }
        }
        if (!bship)
        {
            bship = instance_create(0, 0, obj_enemy_ship);
            bship.pid = p;
        }
        test = buffer_read(buffer, buffer_f32 );
        bship.image_angle = test;//buffer_read(buffer, buffer_u16 );
        bship.x = buffer_read(buffer, buffer_f32 );
        bship.y = buffer_read(buffer, buffer_f32 );  
        bship.shell_signature = buffer_read(buffer, buffer_u16); 
        break;
      }
      case NET_ALL_DATA:
      {
        var t;
        t = buffer_read(buffer, buffer_s32);
        if (t == global.myid)
        {
            obj_ship.shell_type = buffer_read(buffer, buffer_u8);
            obj_ship.shell_mass = buffer_read(buffer, buffer_u16);
            obj_ship.shell_hp = buffer_read(buffer, buffer_u16);
            obj_ship.shell_signature = buffer_read(buffer, buffer_u16);
            obj_ship.shell_hold = buffer_read(buffer, buffer_u16);
            obj_ship.shell_lifesupporting = buffer_read(buffer, buffer_u8);
            obj_ship.engine_type = buffer_read(buffer, buffer_u8);
            obj_ship.engine_fuel = buffer_read(buffer, buffer_u8);
            obj_ship.engine_trace = buffer_read(buffer, buffer_u8);
            obj_ship.engine_thrust = buffer_read(buffer, buffer_f32);
            obj_ship.engine_fuelconsumpton = buffer_read(buffer, buffer_f32);
            obj_ship.engine_speedparticles = buffer_read(buffer, buffer_u8);
            obj_ship.engine_maneuverability = buffer_read(buffer, buffer_f32);
            obj_ship.engine_reliability = buffer_read(buffer, buffer_u8);
            obj_ship.passivearmor_hp = buffer_read(buffer, buffer_u16);
            obj_ship.passivearmor_mass = buffer_read(buffer, buffer_u16);
            obj_ship.activearmor = buffer_read(buffer, buffer_u8);
            obj_ship.weapon_range = buffer_read(buffer, buffer_u16);
            obj_ship.weapon_damage = buffer_read(buffer, buffer_u16);
            obj_ship.weapon_rate = buffer_read(buffer, buffer_f32);
            obj_ship.weapon_accuracy = buffer_read(buffer, buffer_u8);
            obj_ship.power_capacity = buffer_read(buffer, buffer_u8);
            obj_ship.radar_distance = buffer_read(buffer, buffer_u16);
            obj_ship.radar_closedistance = buffer_read(buffer, buffer_u16);
            obj_ship.optics_distance = buffer_read(buffer, buffer_u16);
        }
        break;
      }
   }
