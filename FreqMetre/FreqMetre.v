module FreqMetre(ClkIn,ClkRef,Choix,LedRouge,LedVerte,Aff1,Aff2,Aff3,Aff4,Aff5,Aff6);
input ClkIn;
input ClkRef;
input Choix;

output LedRouge;
output LedVerte;
output[0:6] Aff1;
output[0:6] Aff2;
output[0:6] Aff3;
output[0:6] Aff4;
output[0:6] Aff5;
output[0:6] Aff6;

wire Signal_Gate;
wire[21:0] SignalAff;
wire[21:0] Buffer;
wire[21:0] FreqMes;
wire[21:0] FreqOut;
wire[21:0] PerOut;
wire[24:0] SignalBcd;

//Réalisation de la fenetre de mesure
DivFreq #(1,1,1,1) DivFreqForGate(ClkIn,Signal_Gate);

//Comptage du nombre de front descendant de ClkRef sur la fenetre de mesure
CptXBits #(22,1) Cpt22Bits(Signal_Gate,ClkRef,Buffer);

//Mémorisation du nombre compté
MemGate #(22) MemFreq(Signal_Gate,Buffer,FreqMes);

//Calcul de la Fréquence puis de la période mesurée
CalculFreq #(22,50000000)CalculFreq(FreqMes,FreqOut);
InvertValue #(22,10000,1) CalculPer(FreqOut,PerOut);

//Selection du choix affichage Fréquence ou période
SelectInput #(22) ChoixAff(Choix,FreqOut,PerOut,SignalAff);

//Conversion Valeur binaire en BCD pour afficheur 7 segments
BinaryBcd #(22,28) BinaryBcd(SignalAff,SignalBcd);

//Affichage sur 7 segments
Aff7SegBcd #(0) Aff7SegBcd1(SignalBcd[3:0],Aff1);
Aff7SegBcd #(0) Aff7SegBcd2(SignalBcd[7:4],Aff2);
Aff7SegBcd #(0) Aff7SegBcd3(SignalBcd[11:8],Aff3);
Aff7SegBcd #(0) Aff7SegBcd4(SignalBcd[15:12],Aff4);
Aff7SegBcd #(0) Aff7SegBcd5(SignalBcd[19:16],Aff5);
Aff7SegBcd #(0) Aff7SegBcd6(SignalBcd[24:20],Aff6);

//Selection d'allumage de la LED selon le mode choisi (Fréquence/Période)
SelectOutput SelectSortie(Choix,LedRouge,LedVerte);

endmodule