// Gmsh project created on Mon June 10 17:05:52 2023
//-----------------------------------------------------------------------------------//
// Cristopher Morales Ubal, TU Eindhoven, 10.06.2023, 2D slit geometry perforated burner
//-----------------------------------------------------------------------------------//
//                               Solid zone mesh                                                                   
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
//
//----------------------------------------------------------------------------------//
// Defining geometry parameters
//----------------------------------------------------------------------------------//
//
// following the nomenclature given in Vance paper https://www.sciencedirect.com/science/article/pii/S0010218022000645
//
//Entrance length
H_in=2/1000;  
//Exit length
H_out=8/1000;
//Distance between slit
D=0.8/1000;  
//width slit
W = 0.8/1000;
//+
//plate thickness
T=1.0/1000;
//+
//----------------------------------------------------------------------------------//
// Defining mesh parameters
//----------------------------------------------------------------------------------//
//+
// nf element fluid
nf= 41;
//+
// ns element within slit
ns= 101;
//
// nl_inlet element y direction from slit to inlet
nl_inlet= 201;
// nl_outlet element y direction from slit to outlet
nl_outlet= 501;
// Progression slit
PR= 1.0;
// Progression Inlet
PR_inlet= 1.0;
// Progression Outlet
PR_outlet= 1.0;
//+
//----------------------------------------------------------------------------------//
// Defining points for creating inlet, slit, outlet, and blocks for structured mesh
//----------------------------------------------------------------------------------//
//+
Point(2) = {W/2, 0.0, 0.0, 1.0};
//+
Point(3) = {W/2+D/2, 0.0, 0.0, 1.0};
//+
Point(4) = {W/2+D/2, H_out-T-H_in, 0.0, 1.0};
//+
Point(5) = {W/2, H_out-T-H_in, 0.0, 1.0};
//+
Point(7) = {0.0, H_out-T-H_in, 0.0, 1.0};
//+
Point(9) = {0.0, 0.0, 0.0, 1.0};
//+
Point(10) = {W/2, -T, 0.0, 1.0};
//+
Point(11) = {W/2+D/2, -T, 0.0, 1.0};
//+
Point(12) = {W/2+D/2, -T-H_in, 0.0, 1.0};
//+
Point(13) = {W/2, -T-H_in, 0.0, 1.0};
//+
Point(15) = {0.0,-T-H_in, 0.0, 1.0};
//+
Point(16) = {0.0,-T, 0.0, 1.0};
//+
//----------------------------------------------------------------------------------//
// Creating lines
//----------------------------------------------------------------------------------//
//+
Line(10) = {11, 10}; // slit side
//+
Line(11) = {10, 2};  // slit side
//+
Line(12) = {2, 3};   // slit side
//+
Line(13) = {3,11};   // slit side
//+
//----------------------------------------------------------------------------------//
// Defining curve loops and plane surfaces
//----------------------------------------------------------------------------------//
//+
Curve Loop(2) = {10, 11, 12, 13};
//+
Plane Surface(2) = {2};
//+
//----------------------------------------------------------------------------------//
// make structured mesh with transfinite curves and transfinite surfaces
//----------------------------------------------------------------------------------//
//+
Transfinite Curve {-12,10} = nf Using Progression PR;  // fluid within slit from inlet to outlet x-direction
//+
Transfinite Curve {-11,13} = ns Using Progression PR;  // fluid within slit y-direction 
//+
Transfinite Surface {2};
//+
//----------------------------------------------------------------------------------//
// Defining Physical Groups
//----------------------------------------------------------------------------------//
//+
Physical Curve("symmetry_slit", 25) = {13};
//+
Physical Curve("solid_slit", 26) = {12, 11, 10};
//+
Physical Surface("slit", 27) = {2};
//+
// ----------------------------------------------------------------------------------- //
// Do mesh
// ----------------------------------------------------------------------------------- //
Transfinite Surface "*";
Recombine Surface "*";
//+
//Mesh 1; Mesh 2;
//+
//
// ----------------------------------------------------------------------------------- //
// Save mesh in .su2 format
//Mesh.Format = 42; // .su2 mesh format, 
//Save "2D_slit_burner_mesh.su2";
