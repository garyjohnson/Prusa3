x_rod_distance = 45;

layer_height = 0.3;
layer_width = 2.2 * layer_height;

// Select your belt type ******************************************************

//T2.5
//belt_tooth_distance = 2.5;
//belt_tooth_ratio = 0.5;

//GT2
belt_tooth_distance = 2;
belt_tooth_ratio = 0.5;

//T5 (strongly discouraged)
//belt_tooth_distance = 5;
//belt_tooth_ratio = 0.75;

//HTD3
//belt_tooth_distance = 3;
//belt_tooth_ratio = 0.75;

//MXL
//belt_tooth_distance = 2.032;
//belt_tooth_ratio = 0.64;

// Select your bearing type ******************************************************

// 0 = 608, 1 = 624
bearing_x_idler = 0;
bearing_y_idler = 0;

// Select your hot-end mount ******************************************************

// 0 = none; 1 = groove-mount (J-head/MakerGear etc.)
hotend_mount = 1;

hotend_groovemount_depth = 5;
hotend_groovemount_diameter = 16;

// Select your z endstop type ******************************************************

// 0 = none; 1 = mechanical switch; 2 = hall effect switch
z_endstop_type = 1;
