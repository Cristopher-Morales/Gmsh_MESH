// Gmsh project created on Mon June 10 17:05:52 2023
//-----------------------------------------------------------------------------------//
// Cristopher Morales Ubal, TU Eindhoven, 10.06.2023, 2D slit geometry perforated burner
//-----------------------------------------------------------------------------------//
//                               Fluid zone mesh                                                                   
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
Line(3) = {9, 16};   // symmetry plane (within slit)
//+
Line(7) = {15, 13};  // inlet
//+
Line(8) = {13, 12};  // inlet
//+
Line(9) = {12, 11};  // symmetry plane (inlet to slit)
//+
Line(10) = {11, 10}; // slit side
//+
Line(11) = {10, 2};  // slit side
//+
Line(12) = {2, 3};   // slit side
//+
Line(13) = {3, 4};   // symmetry plane (slit to outlet)
//+
Line(14) = {4, 5};   // outlet
//+
Line(15) = {5, 7};   // outlet
//+
Line(17) = {9, 7};   // symmetry plane (slit to outlet)
//+
Line(18) = {5, 2};   // parallel line to symmetry plane (slit-outlet) for creating structured mesh
//+
Line(19) = {2, 9};   // parallel line to inlet-outlet for creating structured mesh
//+
Line(20) = {16, 10}; // parallel line to inlet-outlet for creating structured mesh
//+
Line(21) = {10, 13}; // parallel line to symmetry plane (inlet to slit) for creating structured mesh
//+
Line(22) = {16, 15}; // symmetry plane (inlet to slit) 
//+
//----------------------------------------------------------------------------------//
// Defining curve loops and plane surfaces
//----------------------------------------------------------------------------------//
//+
Curve Loop(2) = {17, -15, 18, 19};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {18, 12, 13, 14};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {3, 20, 11, 19};
//+
Plane Surface(4) = {4};
//+
Curve Loop(6) = {22, 7, -21, -20};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {21, 8, 9, 10};
//+
Plane Surface(7) = {7};
//+
//----------------------------------------------------------------------------------//
// make structured mesh with transfinite curves and transfinite surfaces
//----------------------------------------------------------------------------------//
//+
Transfinite Curve {-17, 18, -13} = nl_outlet Using Progression PR_outlet; //outlet fluid y-direction
//+
Transfinite Curve {19, 15, -20, -7} = nf Using Progression PR;  // fluid within slit from inlet to outlet x-direction
//+
Transfinite Curve {-12,14, 10, -8} = nf Using Progression PR;   // fluid outside slit from inlet to outlet x-direction
//+
Transfinite Curve {-22, -21, 9} = nl_inlet Using Progression PR_inlet; // inlet fluid y-direction
//+
Transfinite Curve {3, 11} = ns Using Progression PR;  // fluid within slit y-direction 
//+
Transfinite Surface {2};
//+
Transfinite Surface {3};
//+
Transfinite Surface {4};
//+
Transfinite Surface {6};
//+
Transfinite Surface {7};
//+
//----------------------------------------------------------------------------------//
// Defining Physical Groups
//----------------------------------------------------------------------------------//
//+
Physical Curve("inlet", 23) = {7, 8};
//+
Physical Curve("outlet", 24) = {15, 14};
//+
Physical Curve("symmetry_fluid", 25) = {13, 9, 3, 22,17};
//+
Physical Curve("solid_fluid", 26) = {12, 11, 10};
//+
Physical Surface("fluid", 27) = {2, 3, 4, 6, 7};
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
