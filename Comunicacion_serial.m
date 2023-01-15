%%Programa de comunicación serial por: Alberto González Moreno
clc
clear all 
close all
txt = "hola";
%Restea todos los puertos
instrreset
A = input("A qué número de puerto COM te deseas conectar? R: ");
B = input("Inserta la velocidad R: ");
s = serial(['COM' num2str(A)],'BaudRate',B);
s.Terminator = 0;
%Indica el numero de bytes%
%s.BytesAvailableFcnCount = 8;
%Abre el puerto serial 
fopen(s);
while txt ~= "salir"
prompt = "Digita tu mensaje: ";
txt = input(prompt,"s");
sis = size(txt);
    if txt == 'x'
        fprintf(s,txt);
        prompt = "Inserta el nombre:";
        name = [input(prompt,"s") ','];
        fprintf(s,name);
    else
        fprintf(s,txt);
    end
        C = fscanf(s,"%s");
        fprintf("La tiva dice: %s \n",C);
end

