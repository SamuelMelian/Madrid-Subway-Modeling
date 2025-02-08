unit uListaAdy;

{$mode ObjFPC}{$H+}

interface

uses
  uAdy;

TYPE
  TListaAdy = ^TNodoAdy;
  TNodoAdy = RECORD
    info : TAdy;
    sig : ^TNodoAdy;
  END;

PROCEDURE CrearListaVacia(VAR l : TListaAdy);
FUNCTION EsListaVacia(l : TListaAdy): Boolean;
PROCEDURE Construir(VAR l : TListaAdy; e : TAdy);
FUNCTION Longitud(l : TListaAdy): Integer;
PROCEDURE MostrarLista(l : TListaAdy);

implementation

PROCEDURE CrearListaVacia(VAR l : TListaAdy);
BEGIN
  l := NIL;
END;

FUNCTION EsListaVacia(l : TListaAdy): Boolean;
BEGIN
  EsListaVacia := l = NIL;
end;

PROCEDURE Construir(VAR l : TListaAdy; e : TAdy);
VAR
  aux : ^TNodoAdy;
BEGIN
  new(aux);
  asignarAdy(aux^.info, e);
  aux^.sig := l;
  l := aux;
END;

FUNCTION Longitud(l : TListaAdy): Integer;
VAR
  i : integer;
  aux : ^TNodoAdy;
BEGIN
  aux := l;
  i := 0;
  while not EsListaVacia(aux)do
  begin
    aux := aux^.sig;
    i := i + 1;
  end;
  Longitud := i;
END;

PROCEDURE MostrarLista(l : TListaAdy);
VAR
  aux : ^TNodoAdy;
BEGIN
  aux := l;
  while not EsListaVacia(aux) do
  begin
    MostrarAdy(aux^.info);
    aux := aux^.sig;
  end;
end;
end.


