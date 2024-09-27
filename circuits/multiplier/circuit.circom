pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  
   signal input input_A;
   signal input input_B;

   signal X;
   signal Y;

   signal output Z;

   component and--gate=AND();
   component or--gate=OR();
   component not--gate=NOT();

   and--gate.a <== input_A ;
   and--gate.b <== input_B ;
   X <== and--gate.out ;

   not--gate.in <== input_B ;
   Y <== not--gate.out;

   or--gate.a <== X;
   or--gate.b <== Y;
   Z <== or--gate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
