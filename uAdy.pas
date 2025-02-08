unit uAdy;

{$mode ObjFPC}{$H+}

interface

uses
  uElemento;

TYPE
  TAdy = RECORD
    ady : TElementoID;
    peso : integer;
  END;

PROCEDURE AsignarAdy(VAR e1 : TAdy; e2 : TAdy);
PROCEDURE CrearElementoAdy(VAR e : TAdy; ady : TElementoID; peso : integer);
PROCEDURE MostrarAdy(e : TAdy);

implementation

PROCEDURE AsignarAdy(VAR e1 : TAdy; e2 : TAdy);
BEGIN
  e1.peso := e2.peso;
  AsignarID(e1.ady, e2.ady);
end;

PROCEDURE CrearElementoAdy(VAR e : TAdy; ady : TElementoID; peso : integer);
BEGIN
  AsignarID(e.ady, ady);
  e.peso := peso;
end;

PROCEDURE MostrarAdy(e : TAdy);
BEGIN
  writeln('--> ', e.ady);
end;

end.

