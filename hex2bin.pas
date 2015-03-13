(*
UNIT HEX2BIN
============
Coded by Velorek.
Last modified: 17/4/2014
*)
Unit Hex2Bin;
INTERFACE
Const
     TablaHex:array[1..16] of char = ('0','1','2','3','4','5',
                                     '6','7','8','9','A','B',
                                     'C','D','E','F');
Function Potencia(num,pp:longint):longint;
Function Dec2Bin(C:longint):string;
Function Bin2Dec(nbin:string):longint;
Function Dec2Hex(C:longint):string;
Function Hex(sbin:string):char;
Function TablaBin(t:char):string;
Function Hex2Dec(sHex:String):longint;
IMPLEMENTATION
Function Hex(sbin:string):char;
{Convierte un n£mero binario en uno decimal}
Var
i,pot:longint;
cad:string;
code,temp,suma,resto:integer;
Begin
     cad:=sbin;
     i:=1;
     suma:=0;
     temp:=0;
     code:=0;
     resto:=0;
     pot:=0;
     while i<= length(cad) do
     Begin
          Val(Cad[i],temp,code);
          if temp=1 then
             Begin
                  Resto:=length(cad) - (i);
                  Pot := potencia(2,resto);
                  suma:=suma+pot;
                  temp:=0;
                  resto:=0;
                  pot:=0;
             End;
          i:=i+1;
     End;
Hex:=TablaHex[Suma+1];
End;

Function Potencia(num,pp:longint):longint;
{Da la potencia de un n£mero dado}
Var i:longint;
result:longint;
Begin
     result:=1;
     For i:=1 to pp do result:=result*num;
potencia:=result;
End;
Function Dec2Bin(C:longint):string;
{Convierte un n£mero decimal en un n£mero binario}
Var
i,j,r1,r2,resto,divisor,dividendo:longint;
ret,almacena,sub:string;
{Base 2}
Begin
 dividendo:=C;
 sub:='';
 almacena:='';
 r1:=0;
 r2:=0;
 While dividendo >= 2 do
 Begin
       r1:=dividendo div 2; {=>divisor}
       r2:=dividendo mod 2; {=> resto}
       dividendo:=r1;
       Str(r2,sub);
       almacena:=almacena + sub;
 sub:='';
 End;
 r1:=(dividendo*2) div 2;
 Str(r1,sub);
 almacena:=almacena + sub;
j:=0;
i:=length(almacena);
ret:='';
for j:=1 to length(almacena) do ret:=ret+' ';
for j:=1 to length(almacena) do
    Begin
      ret[j]:=almacena[i];
      if i>1 then i:=i-1;
    End;
        Dec2Bin:=ret;
    End;
Function Bin2Dec(nbin:string):longint;
{Convierte un n£mero binario en uno decimal}
Var
i,pot:longint;
cad:string;
code,temp,suma,resto:integer;
Begin
     cad:=nbin;
     i:=1;
     suma:=0;
     temp:=0;
     code:=0;
     resto:=0;
     pot:=0;
     while i<= length(cad) do
     Begin
          Val(Cad[i],temp,code);
          if temp=1 then
             Begin
                  Resto:=length(cad) - (i);
                  Pot := potencia(2,resto);
                  suma:=suma+pot;
                  temp:=0;
                  resto:=0;
                  pot:=0;
             End;
          i:=i+1;
     End;
Bin2Dec:=Suma;
End;
Function Dec2Hex(C:longint):string;
{Convierte un n£mero decimal en un n£mero hexadecimal}
{0 a 255}
Var
globalhex,Binario:String;
i,j,k,d1,d2,r,q:longint;
temp1,temp2,temp3:string;
Begin

     Binario:=Dec2Bin(c);
     d1:=0;
     d2:=0;
     temp1:='';
     temp2:='';
     globalhex:='';
     k:=length(binario);
         j:=0;

             for i:=0 to k do begin
                  {trims the string from right to left len(4)}
                  if j=4 then
                     begin
                        j:=0;
                        r:=length(temp1);
                        for q:=0 to r do
                        begin
                           {inverts string}
                           if q<>r then temp2:=temp2 + temp1[r-q];
                        end;
                        globalhex:=globalhex + hex(temp2);
                        temp1:='';
                        temp2:='';
                     end;
                  j:=j+1;
                if i<>k then temp1:=temp1 + binario[k-i];
             end;
              {invert final piece or small string/number}
              r:=length(temp1);
              for q:=0 to r do
                begin
                     {inverts string}
                     if q<>r then temp2:=temp2 + temp1[r-q];
                end;
              {only add character if sth remains}
              if temp2<>'' then globalhex:=globalhex + hex(temp2);
             {final step: invert string with hex values}
              temp2:='';
              r:=length(globalhex);
              for q:=0 to r do
                begin
                     {inverts string}
                     if q<>r then temp2:=temp2 + globalhex[r-q];
                end;
             globalhex:=temp2;
               {if it's only one character}
             if length(globalhex) = 1 then dec2hex := '0' + globalhex
             else
               dec2hex := globalhex;
end;
Function TablaBin(t:char):string;
Begin
     Case t of
          '0':TablaBin:='0000';
          '1':TablaBin:='0001';
          '2':TablaBin:='0010';
          '3':TablaBin:='0011';
          '4':TablaBin:='0100';
          '5':TablaBin:='0101';
          '6':TablaBin:='0110';
          '7':TablaBin:='0111';
          '8':TablaBin:='1000';
          '9':TablaBin:='1001';
          'A':TablaBin:='1010';
          'B':TablaBin:='1011';
          'C':TablaBin:='1100';
          'D':TablaBin:='1101';
          'E':TablaBin:='1110';
          'F':TablaBin:='1111';
     end;
End;
Function Hex2Dec(sHex:String):longint;
Var
   temp1:string;
   k,i:integer;
Begin
     k:=length(sHex);
     temp1:='';
     for i:=1 to k do
     begin
          temp1:=temp1+ TablaBin(sHex[i]);
     end;
     Hex2Dec:=Bin2Dec(temp1);
End;
End.