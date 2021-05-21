(* ::Package:: *)

(* ::Section:: *)
(*Package header*)


(* Mathematica Package *)

BeginPackage["QINisq`", { "QI`", "QIExtras`"}]
(* Exported symbols added here with SymbolName::usage *)  
Unprotect@@Names["QINisq`*"]
Clear@@Names["QINisq`*" ]


(* ::Section:: *)
(*Public definitions*)


(* ::Subsection:: *)
(*Quantum gates*)


RX::usage = "RX[theta] one-qubit rotation wrt X axis.";


RY::usage = "RX[theta] one-qubit rotation wrt Y axis.";


RZ::usage = "RX[theta] one-qubit rotation wrt Z axis.";


RXP::usage = "PXR[phi, theta] one-qubit rotation of the Bloch vector by an angle theta, where phi is the angle between the rotation axis and the X axis.";


S::usage = "S = RZ[pi/2]";


T::usage = "T = RZ[pi/4]";


toffoli::usage = "Toffoli/controlled-controlled-not gate.";


XX::usage = "Ising gate with parameter \[Theta]."


(* ::Subsection:: *)
(* Fidelity and friends *)


TruncatedFidelity::usage = "<f>TruncatedFidelity</f>[<v>r, s ,m, d</v>] returns quantum fidelity between <v>r</v> and <v>s</v> calculated by projecting <v>s</s> onto the <v>m</v> largest eigenvalues of <v>r</v>. Parameter <v>d</v> controls the accuarys of calculations of the eigenvalues and has default value 10e-6.";


(* ::Section:: *)
(*Private definitions*)


Begin["`Private`"] (* Begin Private Context *) 

QIDocRep = {"<v>" -> "\!\(\*StyleBox[\"" , "</v>" -> "\", \"TI\"]\)", "<f>"->"\!\(\*StyleBox[\"", "</f>" -> "\", \"Input\"]\)", "<s>" -> "", "</s>" -> ""} 
(MessageName[Evaluate[ToExpression[#]], "usage"] = StringReplace[MessageName[Evaluate[ToExpression[#]], "usage"],QIDocRep])& /@ Names["QINisq`*"];


(* ::Subsection:: *)
(*Internal functions (without usage strings)*)


qiNisqAuthors = "Jaroslaw Miszczak <miszczak[at]iitis[dot]pl>";


qiNisqLicense = "GPLv3 <http://www.gnu.org/licenses/gpl.html>";


qiNisqHistory = {
	{"0.0.1", "15/03/2021", "Jarek", "Basic rotation gates."},
	{"0.0.2", "12/04/2021", "Jarek", "TruncatedFidelity moved from QIExtras."},
	{"0.0.2", "07/05/2021", "Jarek", "Added XX gate."},
	{"0.0.3", "17/05/2021", "Jarek", "Added Bloch verctor rotation wrt rotatet X axis."},
	{"0.0.4", "21/05/2021", "Jarek", "Added toffoli, S and T gates"}
};  


qiNisqVersion = Last[qiNisqHistory][[1]];


qiNisqLastModification = Last[qiNisqHistory][[2]];


qiNisqAbout = "QINisq is a Mathematica package encapsulating functions useful for NISQ quantum computing. It is based QI and QIExtras packages.";


(* ::Subsection:: *)
(*Quantum gates*)


RX[theta_]:=MatrixExp[-I theta/2 sx];


RY[theta_]:=MatrixExp[-I theta/2 sy];


RZ[theta_]:=MatrixExp[-I theta/2 sz];


S = RZ[Pi/2];


T = RZ[Pi/4];


RXP[phi_,theta_]:={ {Cos[theta/2], -I Sin[theta/2] Exp[-I phi]}, {-I Sin[theta/2] Exp[I phi], Cos[theta/2]} };


toffoli = Proj[Ket[1,2]]\[CircleTimes]Proj[Ket[1,2]]\[CircleTimes]sx + (Id[4]-Proj[Ket[1,2]]\[CircleTimes]Proj[Ket[1,2]])\[CircleTimes]id;


XX[theta_]:=Cos[theta](Id[2]\[CircleTimes]Id[2])-I Sin[theta](sx\[CircleTimes]sx);


(* ::Subsection:: *)
(* Fidelity and friends *)


TruncatedFidelity[rho_,sigma_,m_,delta_:10^-6]:=Block[{vec,val,proj},
	{val,vec}=Chop[Eigensystem[rho]];
	proj=Plus@@(Proj/@vec[[1;;m]]);
	Chop[Fidelity[proj . rho . proj,proj . sigma . proj],delta]
];


(* ::Section:: *)
(*Package footer*)


Print["Package QINisq ", QINisq`Private`qiNisqVersion, " (last modification: ", QINisq`Private`qiNisqLastModification, ")."];



End[] (* End Private Context *)

Protect@@Names["QINisq`*"]

EndPackage[]






