// The MIT License (MIT)
// 
// Copyright (c) 2014 Michael Maier
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

/**
 * Dieses Skript erstellt Befestigungshaken, mit denen man für die "mobile Lichtanlage" die Lichtleisten an einer Decke/Wand
 * befestigen kann.
 */

module platte() {
	
	difference() {
		hull() {
   			translate([50,0,0]) cylinder(h = 2, d=10, $fa = 1, $fn=100);
   			cylinder(h = 2, d=10, $fa = 1, $fn=100);
		}
		union() {
		   	cylinder(h = 2, d=3, $fa = 1, $fn=100);
		   	translate([50,0,0]) cylinder(h = 2, d=3, $fa = 1, $fn=100);
		}
	}
	
}


module ring( dicke ) {

	translate( [0,dicke/2,2]) rotate( [0,0,00] ) rotate( [90,0,0] ) rotate( [0,0,45] ) translate( [3,3,0] )
	difference() {
		difference() {
			union() {
				cylinder(h = dicke, d=10, $fa = 1, $fn=100);
				rotate( [0,0,45] ) translate( [-5,-5,0]) cube( [5,10,dicke] );
			}
			cylinder(h = dicke, d=7.5, $fa = 1, $fn=100);
		}
		translate([-1,-1,0]) cube( [10,10,dicke] );
	}
}

module halterung(r) {

	if( r == true ) {
		rotate([90,0,0]) { 
		translate( [-24,0,0]) platte(); 
		ring(10);
		}
	}
	else {
		translate( [-24,0,0]) platte(); 
		ring(10);
	}
}


for (y = [0 : 5] )  {
    translate([0, y*15, 0]) halterung(false);
}
