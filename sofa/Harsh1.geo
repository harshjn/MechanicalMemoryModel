
SetFactory("OpenCASCADE");
r = 0.05;
d = 1;


Cylinder(1) = {0, 0, 0, 2*d, 0, 0, r, 2*Pi};

Rotate { {0,1,0},{0,0,0},-Pi/2} {Duplicata {Volume{1}; }}
Rotate { {0,0,1},{0,0,0}, Pi/2} {Duplicata {Volume{1}; }}



Translate{0,0,d}{Duplicata {Volume{1};}}
Translate{0,d,0}{Duplicata {Volume{1};}}
Translate{0,d,d}{Duplicata {Volume{1};}}
Translate{0,2*d,0}{Duplicata {Volume{1};}}
Translate{0,0,2*d}{Duplicata {Volume{1};}}
Translate{0,2*d,2*d}{Duplicata {Volume{1};}}
Translate{0,d,2*d}{Duplicata {Volume{1};}}
Translate{0,2*d,d}{Duplicata {Volume{1};}}


Translate{0.0,d,0}{Duplicata {Volume{2};}}
Translate{d,0.0,0}{Duplicata {Volume{2};}}
Translate{d,d,0}{Duplicata {Volume{2};}}
Translate{0.0,2*d,0}{Duplicata {Volume{2};}}
Translate{2*d,0,0}{Duplicata {Volume{2};}}
Translate{d,2*d,0}{Duplicata {Volume{2};}}
Translate{2*d,2*d,0}{Duplicata {Volume{2};}}
Translate{2*d,d,0}{Duplicata {Volume{2};}}

Translate{0,0,d}{Duplicata {Volume{3};}}
Translate{d,0,0}{Duplicata {Volume{3};}}
Translate{d,0,d}{Duplicata {Volume{3};}}
Translate{2*d,0,0}{Duplicata {Volume{3};}}
Translate{2*d,0,d}{Duplicata {Volume{3};}}
Translate{d,0,2*d}{Duplicata {Volume{3};}}
Translate{2*d,0,2*d}{Duplicata {Volume{3};}}
Translate{0,0,2*d}{Duplicata {Volume{3};}}

BooleanUnion{ 
Volume{1}; 
Volume{2}; 
Volume{3}; 
Volume{4}; 
Volume{5}; 
Volume{6}; 
Volume{7}; 
Volume{8}; 
Volume{9}; 
Volume{10}; 
Volume{11}; 
Volume{12}; 
Volume{13}; 
Volume{14}; 
Volume{15}; 
Volume{16}; 
Volume{17}; 
Volume{18}; 
Volume{19}; 
Volume{20}; 
Volume{21}; 
Volume{22}; 
Volume{23}; 
Volume{24}; 
Volume{25}; 
Volume{26}; 
Delete; }
{ Volume{27}; Delete; }



//Sphere(4) = { 0,0,0,r,-Pi/2,Pi/2,2*Pi};



d=2*d;
Translate{0,0,d}{Duplicata {Volume{1};}}
Translate{0,d,0}{Duplicata {Volume{1};}}
Translate{0,d,d}{Duplicata {Volume{1};}}
Translate{0,2*d,0}{Duplicata {Volume{1};}}
Translate{0,0,2*d}{Duplicata {Volume{1};}}
Translate{0,2*d,2*d}{Duplicata {Volume{1};}}
Translate{0,d,2*d}{Duplicata {Volume{1};}}
Translate{0,2*d,d}{Duplicata {Volume{1};}}



BooleanUnion{ 
Volume{1}; 
Volume{2}; 
Volume{3}; 
Volume{4}; 
Volume{5}; 
Volume{6}; 
Volume{7}; 
Volume{8}; 
Delete; }
{ Volume{9}; Delete; }


//+
Coherence;
