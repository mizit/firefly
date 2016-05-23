buffer_seek(Buffer , buffer_seek_start , 0 );
buffer_write(Buffer, buffer_u8, NET_ALL_DATA);
buffer_write(Buffer, buffer_s32, global.myid);
network_send_packet(Socket, Buffer, buffer_tell(Buffer));
