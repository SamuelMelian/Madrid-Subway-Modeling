unit uElemento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uConjunto;

TYPE
  TElementoID = string;
  TElemento = RECORD
    nombre : TElementoID;
    lineas : TConjunto;
  end;

PROCEDURE Asignar(VAR e1, e2 : TElemento);
PROCEDURE AsignarID(VAR e1 : TElementoID; e2 : TElementoID);
FUNCTION EsIgual(VAR e1, e2 : TElemento) : Boolean;
FUNCTION EsIgualID(e1, e2 : TElementoID) : Boolean;
PROCEDURE SacarID(VAR e1 : TElemento; VAR e2 : TElementoID);
PROCEDURE CrearElemento(s : string; i : integer; VAR e : TElemento);
PROCEDURE UnionElementos(VAR e1, e2 : TElemento);
PROCEDURE Mostrar(e : TElemento);

implementation

PROCEDURE SacarID(VAR e1 : TElemento; VAR e2 : TElementoID);
BEGIN
  e2 := e1.nombre;
end;

FUNCTION EsIgualID(e1, e2 : TElementoID) : Boolean;
BEGIN
  EsIgualID := e1 = e2;
END;

FUNCTION EsIgual(VAR e1, e2 : TElemento) : Boolean;
BEGIN
  EsIgual := e1.nombre = e2.nombre;
end;

PROCEDURE AsignarID(VAR e1 : TElementoID; e2 : TElementoID);
BEGIN
  e1 := e2;
end;

PROCEDURE Asignar(VAR e1, e2 : TElemento);
BEGIN
  AsignarID(e1.nombre, e2.nombre);
  AsignarConjunto(e1.lineas, e2.lineas);
end;

PROCEDURE CrearElemento(s : string; i : integer; VAR e : TElemento);
BEGIN
  e.nombre := s;
  crearConjuntoVacio(e.lineas);
  poner(e.lineas, i);
end;

PROCEDURE UnionElementos(VAR e1, e2 : TElemento);
BEGIN
  union(e1.lineas, e1.lineas, e2.lineas);
end;

PROCEDURE Mostrar(e : TElemento);
BEGIN
  writeln(e.nombre);
  mostrarconjunto(e.lineas);
end;

end.

